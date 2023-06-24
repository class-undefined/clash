#!/bin/bash
# workspace dir: <clash repo dir>
# 这个脚本用于在k8s中创建clash的pod与service
set -e
subscribe=$1
if [ -z "$subscribe" ]; then
    echo "订阅地址 subscribe 不能为空。"
    exit 1
fi
eval $(minikube -p minikube docker-env) # use minikube
bash build.sh $subscribe # build in minikube
kubectl apply -f k8s/yamls/pod.yaml
kubectl apply -f k8s/yamls/service.yaml

