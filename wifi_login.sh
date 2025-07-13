#!/bin/sh

while true; do

  echo "$(date) Attempting login"

  wget -q --post-data="txtLogin=LOGIN&txtPasswd=PASSWORD&chkRemember=1&btnLogin=Login&reqUrl=http://www.google.com&reqCheck=false" \
       -O /dev/null http://10.0.0.1/portal/user-authen.php

  sleep 1

  echo "$(date) Attemping check external internet"

  echo "$(date) Checking DNS resolution (google.com via 1.1.1.1)"
  if nslookup google.com 1.1.1.1 >/dev/null 2>&1; then
    echo "$(date) DNS resolution: OK"
    DNS_OK=1
  else
    echo "$(date) DNS resolution: FAILED"
    DNS_OK=0
  fi

  echo "$(date) Checking ping to 1.1.1.1"
  if ping -c1 1.1.1.1 >/dev/null 2>&1; then
    echo "$(date) Ping: OK"
    PING_OK=1
  else
    echo "$(date) Ping: FAILED"
    PING_OK=0
  fi

  if [ "$DNS_OK" -eq 1 ] && [ "$PING_OK" -eq 1 ]; then
    echo "$(date) Online — exiting"
    exit 0
  fi

  echo "$(date) Sleep 9 sec before repeat cycle"

  sleep 9
done