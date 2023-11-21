FROM jenkins/jenkins:lts-jdk17

MAINTAINER lightsong

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER root

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY groovy/* /usr/share/jenkins/ref/init.groovy.d/

COPY ["entrypoint.sh", "/"]

ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]


