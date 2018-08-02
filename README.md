# Eclipse Che APB

[![Build Status](https://travis-ci.org/ansibleplaybookbundle/eclipse-che-apb.svg?branch=master)](https://travis-ci.org/ansibleplaybookbundle/eclipse-che-apb)
## Description

![alt text](https://raw.githubusercontent.com/eclipse/che-docs/master/src/main/images/che_logo.png)

Deploy Eclipse Che into your OpenShift project using an APB.

## Requirements

- Persistent Volumes
- [Kubernetes Service Catalog](https://github.com/kubernetes-incubator/service-catalog/) and [Ansible Service Broker](https://github.com/openshift/ansible-service-broker)
    ```bash
    ## minishift with OpenShift 3.10
    export MINISHIFT_ENABLE_EXPERIMENTAL=y && \
    minishift config set iso-url centos && \
    minishift start --memory=8gb --cpus=4 --disk-size=50g \
                    --network-nameserver 8.8.8.8 \
                    --openshift-version 3.10.0-rc.0 \
                    --extra-clusterup-flags "--enable=service-catalog,router,registry,web-console,persistent-volumes,rhel-imagestreams,automation-service-broker"
    ```

- :warning: ASB default configuration should be changed or Eclipse Che deployment will fail:
  - openshift [sandbox_role](https://github.com/openshift/ansible-service-broker/blob/master/docs/config.md#openshift-configuration) must be set to `admin` (default is `edit`) to create the correct `RoleBindings` for `che` ServiceAccount
  - dockerhub registry tag must be set to `canary` (default is `latest`) to get the most recent build of the APB
  
  ```bash
  # Edit ASB configuration
  oc edit cm/broker-config -n openshift-automation-service-broker --as system:admin
  
  # Rollout ASB to take config changes
  oc rollout latest dc/openshift-automation-service-broker -n openshift-automation-service-broker --as system:admin
  
  # Trigger APBs reload from the registries (see below for more details about the APB CLI)
  apb bootstrap
  ```

## Unsupported

- TLS
- Ephemeral storage

## Usage

- Troubleshooting Che deployment:
    ```bash
    # Use the following command to retrieve the provisioning logs
    oc get po --all-namespaces --as system:admin | grep eclipse-che-apb-prov | grep Running | awk '{print "oc logs --as system:admin -f -n "$1" "$2}' | bash -
    
    # It may be useful to look at ASB logs
    oc logs -f dc/openshift-automation-service-broker -n openshift-automation-service-broker --as system:admin
    
    # Or look at the provisioning pods
    oc get po --all-namespaces --as system:admin | grep eclipse-che-apb-prov
    ```
- Uninstall (deprovisioning) Che:
    ```bash
    # Trigger serviceinstance deprovisioning
    oc get serviceinstance -n eclipse-che-apb | grep apb | awk '{ print $1 }' | xargs oc delete -n eclipse-che-apb serviceinstance 
    
    # Follow the deprovisioning logs
    oc get po --all-namespaces --as system:admin | grep eclipse-che-apb-dep | grep Running | awk '{print "oc logs --as system:admin -f -n "$1" "$2}' | bash -
    ```

## Development

### Using [APB CLI](https://github.com/ansibleplaybookbundle/ansible-playbook-bundle/blob/master/docs/apb_cli.md)

- Install `apb`
    ```bash
    # Download and install the APB CLI bash script 
    APB_URL=https://raw.githubusercontent.com/ansibleplaybookbundle/ansible-playbook-bundle/master/scripts/apb-docker-run.sh
    curl -sSL "${APB_URL}" > /usr/local/bin/apb && chmod +x /usr/local/bin/apb
    
    # The OpenShift user that will run the APB CLI should have enough privileges
    OS_USER=developer
    oc adm policy add-cluster-role-to-user cluster-admin "${OS_USER}"
    
    # On minishift, for apb CLI to work properly:
    eval $(minishift docker-env)
    ```
- Build and push the APB to the local registry

    :warning: When using minishift a Docker deamon should run on the host as well as the one in the minishift VM. For example on OSX, Docker for Mac and minishift should be both running when executing `apb` commands.

    ```bash
    git clone git@github.com:ansibleplaybookbundle/eclipse-che-apb.git
    cd eclipse-che-apb
    apb list # optional
    apb build
    apb push
    ```
    
    To filter out APBs except local ones [change the ASB config](https://github.com/openshift/ansible-service-broker/blob/master/docs/config.md#local-openshift-registry).

### CLI Testing

This is the fastest way to test the APB using the CLI:

- Setup the registry and the seviceaccount
    ```bash
    # setup minishift
    export APB_NAME=eclipse-che-apb
    export OC_USER=`oc whoami` OC_PASS=`oc whoami -t`
    export REGISTRY=`oc get svc/docker-registry -n default --as system:admin --template '{{.spec.clusterIP}}:{{index .spec.ports 0 "port"}}'`
    oc new-project $APB_NAME
    docker login -u ${OC_USER} -p ${OC_PASS} ${REGISTRY}
    oc create sa apb
    oc adm policy add-role-to-user admin -z apb
    ```
- Build and push the APB image
    ```bash
    docker build -t $APB_NAME .
    docker tag "${APB_NAME}" "${REGISTRY}/${APB_NAME}/${APB_NAME}"
    docker push "${REGISTRY}/${APB_NAME}/${APB_NAME}"
    ```
- Test the local image
    ```bash
    oc run "${APB_NAME}-test" -it --restart='Never' --image "${REGISTRY}/${APB_NAME}/${APB_NAME}" --env "OPENSHIFT_TOKEN=${OC_PASS}" --env "OPENSHIFT_TARGET=https://kubernetes.default.svc" --env "POD_NAME=${APB_NAME}-test" --env "POD_NAMESPACE=${APB_NAME}" --overrides='{"apiVersion":"v1","spec":{"serviceAccountName":"apb"}}' -- test -e namespace=${APB_NAME}
    ```    
- Deprovision
    ```bash
    oc run "${APB_NAME}-dep" -it --restart='Never' --image "${REGISTRY}/${APB_NAME}/${APB_NAME}" --env "OPENSHIFT_TOKEN=${OC_PASS}" --env "OPENSHIFT_TARGET=https://kubernetes.default.svc" --env "POD_NAME=${APB_NAME}-dep" --env "POD_NAMESPACE=${APB_NAME}" --overrides='{"apiVersion":"v1","spec":{"serviceAccountName":"apb"}}' -- deprovision -e namespace=${APB_NAME}
    ```
- Cleanup
    ```bash
    oc delete all -l app=che
    oc delete all -l app=keycloak
    oc rsh dc/postgresql-9.6-prod bash -c "dropdb dbche" && \
    oc rsh dc/postgresql-9.6-prod bash -c "dropdb keycloak" && \
    oc delete all --all && \
    oc delete secret postgres && \
    oc delete cm che && \
    oc delete rolebinding che-admin && \
    oc delete serviceaccount che
    ```

## Resources

- [Ansible Playbook Bundle - Getting Started](https://github.com/ansibleplaybookbundle/ansible-playbook-bundle/blob/master/docs/getting_started.md)
- [Ansible Service Broker (ASB)](https://github.com/openshift/ansible-service-broker)
- [APB CLI](https://github.com/ansibleplaybookbundle/ansible-playbook-bundle/blob/master/docs/apb_cli.md#push)
- [Ansible Kubernetes Module](https://github.com/ansible/ansible-kubernetes-modules) (depracated but it's still what we are using)
- [Ansilbe k8s module](https://docs.ansible.com/ansible/latest/modules/k8s_module.html)
- [Kubernetes Service Catalog](https://github.com/kubernetes-incubator/service-catalog/)
- [Blog Post on APB development and testing](https://blog.openshift.com/apb-development-testing-part-1/)
