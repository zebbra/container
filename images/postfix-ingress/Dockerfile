FROM alpine:3
LABEL org.opencontainers.image.source = "https://github.com/zebbra/container"
LABEL org.opencontainers.image.description="postfix ingress"

RUN apk --no-cache add \
    bash \
    curl \
    openssl \
    postfix

# set some hardcoded defaults
COPY main.cf /etc/postfix/main.cf

# override default master.cf (local delivery disabled)
COPY master.cf /etc/postfix/master.cf

# download Mozilla DHE params
RUN curl -Lsf -o /etc/postfix/dhparams.pem https://ssl-config.mozilla.org/ffdhe2048.txt

COPY postfix.sh /usr/bin/postfix.sh
RUN chmod 550 /usr/bin/postfix.sh

CMD ["/usr/bin/postfix.sh"]
