FROM alpine:3.1

ENV KIBANA_VERSION 4.1.0

RUN apk add --update nodejs curl && \
    curl -LO https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    tar xzf /kibana-${KIBANA_VERSION}-linux-x64.tar.gz -C / && \
    rm /kibana-${KIBANA_VERSION}-linux-x64/node/bin/node && \
    rm /kibana-${KIBANA_VERSION}-linux-x64/node/bin/npm && \
    ln -s /usr/bin/node /kibana-${KIBANA_VERSION}-linux-x64/node/bin/node && \
    ln -s /usr/bin/npm /kibana-${KIBANA_VERSION}-linux-x64/node/bin/npm && \
    rm -rf /var/cache/apk/* /kibana-${KIBANA_VERSION}-linux-x64.tar.gz && \
    mv /kibana-${KIBANA_VERSION}-linux-x64 /app

EXPOSE 5601

CMD ["/app/bin/kibana"]
