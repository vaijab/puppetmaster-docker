FROM fedora:20

RUN yum update -y -q; yum clean all
RUN yum install -y -q http://yum.puppetlabs.com/puppetlabs-release-fedora-20.noarch.rpm; \
  yum install -y -q puppet-server puppetdb puppetdb-terminus; yum clean all

ADD puppet/ /etc/puppet/
ADD run.sh /run.sh

EXPOSE 8140 8081

CMD ["/run.sh"]
