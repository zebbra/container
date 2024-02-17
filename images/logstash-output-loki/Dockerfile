ARG VERSION
FROM docker.elastic.co/logstash/logstash:${VERSION}
LABEL org.opencontainers.image.source = "https://github.com/zebbra/container"
LABEL org.opencontainers.image.description="logstash + loki output plugin"

RUN logstash-plugin install logstash-output-loki
