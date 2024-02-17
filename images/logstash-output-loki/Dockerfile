ARG VERSION
FROM docker.io/bitnami/logstash:${VERSION}
LABEL org.opencontainers.image.source = "https://github.com/zebbra/container"
LABEL org.opencontainers.image.description="logstash + loki output plugin"

# Add PostgreSQL JDBC driver
USER root
RUN apt-get update \
    && apt-get install -y \
        curl \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

ENV POSTGRES_JDBC_DRIVER_VERSION="42.7.1"
ENV POSTGRES_JDBC_DRIVER_LIBRARY="/opt/bitnami/logstash/extras/postgresql-${POSTGRES_JDBC_DRIVER_VERSION}.jar"
RUN mkdir /opt/bitnami/logstash/extras
RUN curl -Lf \
    -o ${POSTGRES_JDBC_DRIVER_LIBRARY} \
    https://jdbc.postgresql.org/download/postgresql-${POSTGRES_JDBC_DRIVER_VERSION}.jar

# Fix permissions
RUN \
    chown logstash:root /opt/bitnami/logstash/data && \
    chmod 775 /opt/bitnami/logstash/data

# Add loki output plugin
USER logstash
RUN logstash-plugin install logstash-output-loki
