FROM markwatsonatx/spark:2.1.1

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

WORKDIR /usr/local

RUN apk update
RUN apk add python3-dev 
RUN apk add build-base
RUN python3 -m ensurepip 
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
#RUN apt-get install -y libjansi-native-java libhawtjni-runtime-java libjansi-java
#RUN wget http://www.scala-lang.org/files/archive/scala-2.10.4.deb
#RUN dpkg -i scala-2.10.4.deb

#ENV PATH "/anaconda/bin:$PATH"

RUN mkdir /usr/notebooks

WORKDIR /root/.local/share/jupyter/kernels
#RUN mkdir apache_toree_scala
#ADD apache_toree_scala ./apache_toree_scala
RUN mkdir pyspark
ADD pyspark ./pyspark

RUN mkdir /root/.jupyter/
WORKDIR /root/.jupyter/
ADD jupyter_notebook_config.py ./

WORKDIR /
ADD startup.sh ./

CMD ["/startup.sh"]

EXPOSE 7077
EXPOSE 8080
EXPOSE 8889
