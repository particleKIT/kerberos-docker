# Simple Kerberos Container

Basic setup:

  * create the direcories to be mounted in the container  
    ``mkdir -p $PWD/krb5/{lib/{krb5/user, krb5kdc}, log}``
  * and place your `$PWD/krb5/krb5.conf` and `$PWD/krb5/lib/krb5kdc/kdc.conf` (as well as acl, dict, keytab and stash files)
  * setup the database:  
    ```
    docker run -v $PWD/krb5/krb5.conf:/etc/krb5.conf \
               -v $PWD/krb5/lib:/var/lib/kerberos \
               -v $PWD/krb5/log:/var/log/krb5 \
               --name krb5 -ti --rm krb5 
               /usr/lib/mit/sbin/kdb5_util create -r EXAMPLE.COM -s
    ```
  * create principals:  
    ```
    docker run -v $PWD/krb5/krb5.conf:/etc/krb5.conf \
               -v $PWD/krb5/lib:/var/lib/kerberos \
               -v $PWD/krb5/log:/var/log/krb5 \
               --name krb5 -ti --rm krb5 
               /usr/lib/mit/sbin/kadmin.local
    ```
  * start daemon:  
    ```
    docker run -v $PWD/krb5/krb5.conf:/etc/krb5.conf \
               -v $PWD/krb5/lib:/var/lib/kerberos \
               -v $PWD/krb5/log:/var/log/krb5 \
               --name krb5 -d krb5
    ```
  * see logs at `docker logs krb5` and `$PWD/krb5/log`.
