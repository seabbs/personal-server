FROM jenkins/jenkins:latest
 
USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

## Install Docker
RUN apt-get update -y \ 
      && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common \
      && curl -fsSL https://download.docker.com/linux/debian/gpg | \
      apt-key add -

RUN add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" \
      && apt-get update -y \
	  && apt-get install -y docker-ce

## Install docker-compose
RUN sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

RUN sudo chmod +x /usr/local/bin/docker-compose

USER jenkins
