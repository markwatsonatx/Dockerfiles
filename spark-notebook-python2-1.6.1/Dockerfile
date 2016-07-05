FROM markwatsonatx/spark:1.6.1

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

WORKDIR /spark

RUN apt-get -y install bzip2 curl libglib2.0-0 libxext6 libsm6 libxrender1
RUN wget http://repo.continuum.io/archive/Anaconda2-4.1.0-Linux-x86_64.sh
RUN bash Anaconda2-4.1.0-Linux-x86_64.sh -b -p /anaconda
RUN apt-get install -y libjansi-native-java libhawtjni-runtime-java libjansi-java
RUN wget http://www.scala-lang.org/files/archive/scala-2.10.4.deb
RUN dpkg -i scala-2.10.4.deb

ENV PATH "/anaconda/bin:$PATH"

RUN mkdir /usr/notebooks

WORKDIR /root/.local/share/jupyter/kernels
RUN mkdir apache_toree_scala
ADD apache_toree_scala ./apache_toree_scala
RUN mkdir pyspark
ADD pyspark ./pyspark

WORKDIR /spark
ADD startup.sh ./

CMD ["/spark/startup.sh"]

EXPOSE 7077
EXPOSE 8080
EXPOSE 8889
