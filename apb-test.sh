#!/bin/bash

export IPADDR=$(sudo ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
sudo sed -i "s/\DOCKER_OPTS=\"/DOCKER_OPTS=\"--insecure-registry=172.30.0.0\/16 /g" /etc/default/docker
sudo cat /etc/default/docker
sudo service docker restart
export APB_NAME=eclipse-che-apb
docker build -t $APB_NAME .
export B64_SPEC=`base64 apb.yml | tr -d '\n'`
export APB_LABEL=`docker inspect --format='{{json .Config.Labels}}' $(docker images -q | head -n 1) | jq '."com.redhat.apb.spec"' | cut -d'"' -f2 | tr -d '\n'`
if [ "$B64_SPEC" != "$APB_LABEL" ]; then { echo "APB Spec Label doesn't match, run - apb prepare"; exit -1; }; fi;
sudo docker cp $(docker create docker.io/openshift/origin:$OPENSHIFT_VERSION):/bin/oc /usr/local/bin/oc
oc cluster up --version=$OPENSHIFT_VERSION --routing-suffix "${IPADDR}.nip.io"
export OC_USER=`oc whoami` OC_PASS=`oc whoami -t`
oc login -u system:admin
oc rollout status -w dc/docker-registry -n default || oc rollout retry dc/docker-registry -n default && oc rollout status -w dc/docker-registry -n default
export REGISTRY=`oc get svc/docker-registry -n default --template '{{.spec.clusterIP}}:{{index .spec.ports 0 "port"}}'`
oc login --insecure-skip-tls-verify --token=${OC_PASS}
oc new-project $APB_NAME
docker login -u ${OC_USER} -p ${OC_PASS} ${REGISTRY}
docker tag "${APB_NAME}" "${REGISTRY}/${APB_NAME}/${APB_NAME}"
docker push "${REGISTRY}/${APB_NAME}/${APB_NAME}"
oc create sa apb
oc adm policy add-role-to-user admin -z apb
oc run "${APB_NAME}-test" -it --restart='Never' --image "${REGISTRY}/${APB_NAME}/${APB_NAME}" --env "OPENSHIFT_TOKEN=${OC_PASS}" --env "OPENSHIFT_TARGET=https://kubernetes.default.svc" --env "POD_NAME=${APB_NAME}-test" --env "POD_NAMESPACE=${APB_NAME}" --overrides='{"apiVersion":"v1","spec":{"serviceAccountName":"apb"}}' --env "POD_NAMESPACE=${APB_NAME}" --overrides='{"apiVersion":"v1","spec":{"serviceAccountName":"apb"}}' -- test --extra-vars "{"che_external_db": "false", "external_keycloak": "false", "che_secure_routes": "false", "keycloak_provision_realm_user": "true", "namespace": "$APB_NAME"}"