FROM jenkins
MAINTAINER "Gustavo Soares Souza" gustavosoares@gmail.com
ENV REFRESHED_AT 2015-10-25

USER root

RUN apt-get update -y \
    && apt-get install -y python2.7 python2.7-dev python-pip \
    && pip install -U pip \
    && pip install virtualenv==13.1.2 \
    && pip install virtualenvwrapper==4.7.1

ENV JENKINS_HOME /var/jenkins_home
ENV WORKON_HOME $JENKINS_HOME/.virtualenvs
ENV PIP_VIRTUALENV_BASE $JENKINS_HOME/.virtualenvs

RUN mkdir /var/jenkins_home/.virtualenvs \
    && echo "source /usr/local/bin/virtualenvwrapper.sh" >>/var/jenkins_home/.bashrc \

USER jenkins

WORKDIR $JENKINS_HOME