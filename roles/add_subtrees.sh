#!/bin/bash


set -x

git remote add -f keycloak-apb git@github.com:jcpowermac/keycloak-apb.git
git remote add -f postgresql-apb git@github.com:jcpowermac/postgresql-apb.git

git subtree add --prefix roles/keycloak-apb keycloak-apb roles_only --squash
git subtree add --prefix roles/postgresql-apb postgresql-apb roles_only --squash
