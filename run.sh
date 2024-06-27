#!/bin/bash -xe
export cluster_name=${1:?}
export external_domain=${2:?}

mkdir -p tmp

envsubst < service.yaml > tmp/customized-service.yaml
envsubst < ingresscontroller.yaml > tmp/customized-ingresscontroller.yaml

