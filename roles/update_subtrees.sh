#!/bin/bash


set -x
git subtree pull --prefix roles/keycloak-apb keycloak-apb roles_only --squash
git subtree pull --prefix roles/postgresql-apb postgresql-apb roles_only --squash

