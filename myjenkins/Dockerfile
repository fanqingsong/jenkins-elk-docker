FROM jenkins/jenkins:lts-jdk17

MAINTAINER lightsong

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER root

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/

RUN curl -o /tmp/filebeat_1.0.1_amd64.deb https://download.elastic.co/beats/filebeat/filebeat_1.0.1_amd64.deb && \
    dpkg -i /tmp/filebeat_1.0.1_amd64.deb &&  apt-get install

COPY filebeat.yml /etc/filebeat/filebeat.yml

COPY ["entrypoint.sh", "/"]

ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]


