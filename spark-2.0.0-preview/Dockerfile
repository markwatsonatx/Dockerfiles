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

WORKDIR /spark

ADD startup.sh ./

RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-preview-bin-hadoop2.7.tgz 
RUN gunzip spark-2.0.0-preview-bin-hadoop2.7.tgz 
RUN tar -xf spark-2.0.0-preview-bin-hadoop2.7.tar 

ENV SPARK_HOME /spark/spark-2.0.0-preview-bin-hadoop2.7

CMD ["/spark/startup.sh"]

EXPOSE 7077
EXPOSE 8080
