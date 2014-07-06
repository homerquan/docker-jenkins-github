FROM ubuntu:14.04
MAINTAINER Homer Quan "support@homerquan.com"

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
RUN apt-get install -q -y ssh nodejs npm git && apt-get clean
RUN ln -s /usr/bin/nodejs /usr/bin/node
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins
ADD .netrc /root/.netrc
RUN cat /dev/zero | ssh-keygen -q -N ""
RUN echo "=== Copy below pub key into your github account ==="
RUN cat /root/.ssh/id_rsa.pub
# ignore host checking
RUN echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
CMD [""]
