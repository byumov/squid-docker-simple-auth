#!/bin/sh

if [ -z ${SQUID_USERNAME+x} ]; 
then 
  echo "env var SQUID_USERNAME must be set";
  exit 1;
fi

if [ -z ${SQUID_PASSWORD+x} ]; 
then 
  echo "env var SQUID_PASSWORD must be set"; 
  exit 1;
fi

htpasswd -bc /etc/squid/squid_passwd "${SQUID_USERNAME}" "${SQUID_PASSWORD}"
chown proxy /proc/self/fd/1
exec squid3 -N $*
