#!/bin/bash
set \
  -o errexit \
  -o nounset \
  -o pipefail

postconf myhostname="${MYHOSTNAME}"
newaliases

echo "postmaster ${POSTMASTER_EMAIL}" > /etc/postfix/virtual
echo "abuse ${POSTMASTER_EMAIL}" >> /etc/postfix/virtual
postmap /etc/postfix/virtual

postconf mynetworks="${PERMITTED_NETWORKS}"
postconf relayhost="[${SMTP_HOST}]:${SMTP_PORT}"

echo "[${SMTP_HOST}]:${SMTP_PORT} ${SMTP_USERNAME}:${SMTP_PASSWORD}" > /etc/postfix/relay_auth
postmap /etc/postfix/relay_auth

exec postfix start-fg
