#!/bin/bash -xe
EXTERNAL_DOMAIN=${1:?}
export NAMESPACE=test
export APP_NAME=hello-openshift

oc new-project "${NAMESPACE}"
oc label namespace/"${NAMESPACE}" ingress=custom
oc get namespace "${NAMESPACE}" -o yaml

oc new-app --docker-image=docker.io/openshift/"${APP_NAME}" -n "${NAMESPACE}"
oc expose svc "${APP_NAME}" --hostname "${APP_NAME}"."${EXTERNAL_DOMAIN}"