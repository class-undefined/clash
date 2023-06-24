FROM centos:7
# 订阅地址
COPY ./res/ /tmp/
ENV PATH="/usr/local/bin:/usr/bin:${PATH}"
RUN gzip -d /tmp/clash-linux-amd64-v1.16.gz \
    && chmod +x /tmp/clash-linux-amd64-v1.16 \
    && mv /tmp/clash-linux-amd64-v1.16 /usr/bin/clash \
    && mkdir -p /root/.config/clash \
    && cp /tmp/Country.mmdb /root/.config/clash/ \
    && mv /tmp/config.yaml /root/.config/clash/ \
    && rm -rf /tmp/*

ENTRYPOINT "/usr/bin/clash"
EXPOSE 7890
EXPOSE 7891
EXPOSE 9090


