#!/usr/bin/bash

/usr/bin/puppet master --no-daemonize --verbose &

sleep 5
/usr/sbin/puppetdb ssl-setup

su - puppetdb -s /usr/bin/bash -c 'source /etc/sysconfig/puppetdb; \
  /usr/lib/jvm/jre-1.7.0-openjdk/bin/java \
  $JAVA_ARGS \
  -cp ${INSTALL_DIR}/puppetdb.jar \
  clojure.main -m com.puppetlabs.puppetdb.core \
  services -c ${CONFIG} $@ > /dev/null'

