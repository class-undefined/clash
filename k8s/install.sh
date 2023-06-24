#!/bin/bash
# workspace dir: <clash repo dir>
# 这个脚本用于在k8s中创建clash的deployment与service, 你应该在执行k8s/build.sh之后使用
set -e
kubectl create namespace clash 
kubectl apply -f k8s/yamls/deployment.yaml
kubectl apply -f k8s/yamls/service.yaml

