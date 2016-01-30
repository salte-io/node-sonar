FROM node:5
MAINTAINER Dave Woodward <davidwoodwrd@hotmail.com>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get update -y && \
    apt-get upgrade -y && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get install -y zip && \
    apt-get clean
RUN curl -o /opt/sonar.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.5.zip && \
    cd /opt && \
    unzip sonar.zip && \
    rm sonar.zip

ENV PATH $PATH:/opt/sonar-scanner-2.5/bin
ENV SONAR_RUNNER_HOME /opt/sonar-scanner-2.5
