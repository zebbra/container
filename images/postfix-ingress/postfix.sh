#!/bin/bash
set \
  -o errexit \
  -o nounset \
  -o pipefail \
  -o xtrace

postconf myhostname="${POSTFIX_MYHOSTNAME}"
newaliases

postconf relay_domains="${POSTFIX_RELAY_DOMAINS}"

echo "${POSTFIX_TRANSPORT}" > /etc/postfix/transport
chmod 400 /etc/postfix/transport
postmap /etc/postfix/transport

exec postfix start-fg
