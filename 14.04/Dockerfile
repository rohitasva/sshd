FROM ubuntu:14.04
MAINTAINER rohitasva "https://github.com/rohitasva"

RUN apt-get update && apt-get install -y openssh-server

ENV HOME /var/lib/jenkins

RUN groupadd jenkins 
RUN groupId=$(cat /etc/group | grep jenkins | awk -F ":" '{print $3}') && useradd -g $groupId -d ${HOME} -s /bin/bash jenkins

EXPOSE 22

RUN mkdir -p ${HOME}/.ssh

COPY authorized_keys ${HOME}/.ssh/authorized_keys
RUN chmod 0600 ${HOME}/.ssh/authorized_keys && chown -R jenkins.jenkins $HOME
RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]

