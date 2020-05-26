FROM particlekit/ldap-client
MAINTAINER TTP/ITP <admin@particle.kit.edu>

ENV KRB5KDC_ARGS=""\
    KADMIN_ARGS=""

RUN zypper ref && zypper --non-interactive dup --no-recommends &&\
    zypper --non-interactive in --no-recommends krb5 krb5-server krb5-client &&\
    mkdir -p /run/user/0/krb5cc

VOLUME "/var/lib/kerberos"
VOLUME "/var/log/krb5/"
ADD init.sh /init.sh

CMD ["/init.sh"]
