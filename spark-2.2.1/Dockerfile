FROM openjdk:8u131-jdk-alpine

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apk add --no-cache bash \
    wget \
    python3

WORKDIR /usr/local
RUN wget http://apache.claz.org/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz -O - | tar -xz

ENV SPARK_HOME /usr/local/spark-2.2.1-bin-hadoop2.7

ADD startup.sh /
CMD ["/startup.sh"]

EXPOSE 7077
EXPOSE 8080
