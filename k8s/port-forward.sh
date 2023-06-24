pod_id=$1
kubectl port-forward -n clash $pod_id 9090:9090

# export https_proxy=http://http-proxy-svc.clash:7890 http_proxy=http://http-proxy-svc.clash:7890 all_proxy=socks5://http-proxy-svc.clash:7890
