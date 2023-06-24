#!/bin/bash
set -e
subscribe=$1
if [ -z "$subscribe" ]; then
    echo "订阅地址 subscribe 不能为空。"
    exit 1
fi
mkdir -p res
if [ ! -e res/clash-linux-amd64-v1.16.gz ]; then
    wget -O res/clash-linux-amd64-v1.16.gz https://github.com/Dreamacro/clash/releases/download/v1.16.0/clash-linux-amd64-v1.16.0.gz
fi

if [ ! -e res/Country.mmdb ]; then
    wget -O res/Country.mmdb https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb
fi

if [ ! -e res/config.yaml ]; then
    wget --no-check-certificate -O res/config.yaml $subscribe
fi

docker build -t clash-proxy .