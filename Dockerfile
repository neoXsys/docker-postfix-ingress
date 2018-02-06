FROM centos:6

RUN yum -y update && yum -y install coreutils postfix  mailx cronie && yum clean all
#
#ADD ./postfix-setup.sh /tmp/postfix-setup.sh
#RUN /bin/sh /tmp/postfix-setup.sh

ADD ./transport.sh /tmp/transport.sh
ADD https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl /tmp/
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /tmp/jq
RUN ["/bin/sh", "-c", " chmod +x /tmp/kubectl"]
RUN ["/bin/sh", "-c", " chmod +x /tmp/jq"]
RUN ["/bin/sh", "-c", " chmod +x /tmp/transport.sh"]
RUN ["/bin/sh", "-c", " touch /etc/postfix/transport; postmap hash:/etc/postfix/transport"]

RUN cp /tmp/kubectl /usr/bin/
RUN cp /tmp/jq /usr/bin/

#RUN postconf -e 'transport_maps = hash:/etc/postfix/transport'
# Add crontab file in the cron directory
ADD main.cf /etc/postfix/

EXPOSE 25

cmd ["sh", "-c", "nohup /tmp/transport.sh  &>> /var/log/messages"]
