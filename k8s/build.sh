#!/bin/bash
# workspace dir: <clash repo dir>
set -e
subscribe=$1
if [ -z "$subscribe" ]; then
    echo "订阅地址 subscribe 不能为空。"
    exit 1
fi
eval $(minikube -p minikube docker-env) # use minikube
bash build.sh $subscribe # build in minikube