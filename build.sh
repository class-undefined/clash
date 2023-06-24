#!/bin/bash
subscribe=$1
if [ -z "$subscribe" ]; then
    echo "订阅地址 subscribe 不能为空。"
    exit 1
fi
mkdir res
wget -O res/Centos-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
wget -O res/clash-linux-amd64-v1.16.gz https://github.com/Dreamacro/clash/releases/download/v1.16.0/clash-linux-amd64-v1.16.0.gz
wget -O res/Country.mmdb https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb
docker build -t clash-proxy --build-arg subscribe=$subscribe .