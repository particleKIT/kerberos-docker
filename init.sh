#!/bin/bash

# start kadmin in background
/usr/lib/mit/sbin/kadmind -P /var/run/kadmind.pid $KADMIND_ARGS

# start kdc in foreground
/usr/lib/mit/sbin/krb5kdc -n -P /var/run/krb5kdc.pid $KRB5KDC_ARGS
