FROM centos:7
# 订阅地址
ARG subscribe
COPY ./res/ /tmp/
ENV PATH="/usr/local/bin:/usr/bin:${PATH}"
RUN mv /tmp/Centos-7.repo /etc/yum.repos.d/ \
    && yum -y makecache \
    && yum -y install which lsof curl wget ll \
    && gzip -d /tmp/clash-linux-amd64-v1.16.gz \
    && chmod +x /tmp/clash-linux-amd64-v1.16 \
    && mv /tmp/clash-linux-amd64-v1.16 /usr/bin \
    && mkdir -p /opt/clash \
    && cp /tmp/Country.mmdb /opt/clash \
    && wget --no-check-certificate -O /opt/clash/config.yaml ${subscribe}

CMD [ "clash" "-d" "/opt/clash" ]
EXPOSE 7890
EXPOSE 7891
EXPOSE 9090


