FROM centos:7 
MAINTAINER Joel Salas "joel.salas@hautelook.com"

# Install packages, EPEL must come first 
RUN yum -y update && yum -y install epel-release
RUN yum -y install \
  nagios \
  nagios-plugins-all
# RUN rm -rf /etc/nagios/*
# RUN mkdir -p /srv/nagios
# RUN mkdir -p /srv/nagios/plugins
# RUN mkdir -p /var/nagios
# RUN mkdir -p /var/nagios/spool
RUN mkdir -p /var/log/nagios/rw && touch /var/log/nagios/rw/nagios.qh
# RUN mkdir -p /var/nagios/spool/checkresults
RUN chown -R nagios: /var/log/nagios

# Trailing slash is important
COPY objects /etc/nagios/objects/
COPY plugins /etc/nagios/plugins/
COPY *.cfg /etc/nagios/
CMD ["nagios", "/etc/nagios/nagios.cfg"]
