FROM debian:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get -y install oracle-java8-installer
RUN apt-get -y install wget

WORKDIR /dynamodb

ADD startup.sh ./

RUN wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz 
RUN gunzip dynamodb_local_latest.tar.gz
RUN tar -xf dynamodb_local_latest.tar 

CMD ["/dynamodb/startup.sh"]

EXPOSE 8000
