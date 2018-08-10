FROM alpine:latest

LABEL maintainer="Herald Yu <yuhr123@gmail.com>"  

RUN apk add --update curl jq \
    && rm -rf /var/cache/apk/*

ENV release=v0.20.0

RUN set -x \
    && mkdir /frp \
    && cd /frp \
    && release=${release:-$(curl -s https://api.github.com/repos/fatedier/frp/releases/latest | jq -r .tag_name )} \
    && curl -s -L https://github.com/fatedier/frp/releases/download/${release}/frp_${release/v/}_linux_amd64.tar.gz \
    | tar -zx \
    && cd frp_${release/v/}_linux_amd64 \
    && cp frps /usr/local/bin/ \
    && chmod +x /usr/local/bin/frps \
    && mkdir /etc/frp \
    && cp frps.ini /etc/frp/ \
    && cd .. \
    && rm -rf frp_${release/v/}_linux_amd64

VOLUME [ "/etc/frp" ]

EXPOSE 7000

CMD [ "/usr/local/bin/frps", "-c", "/etc/frp/frps.ini" ]
