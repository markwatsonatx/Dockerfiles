FROM markwatsonatx/spark:1.6.1

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

WORKDIR /spark

RUN apt-get -y install bzip2 curl libglib2.0-0 libxext6 libsm6 libxrender1
RUN wget http://repo.continuum.io/archive/Anaconda2-4.1.0-Linux-x86_64.sh
RUN bash Anaconda2-4.1.0-Linux-x86_64.sh -b -p /anaconda
RUN wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
RUN dpkg -i scala-2.11.8.deb
RUN curl -L -o jupyter-scala https://git.io/vrHhi
RUN chmod +x jupyter-scala
RUN ./jupyter-scala
RUN rm -f jupyter-scala

ENV PATH "/anaconda/bin:$PATH"

RUN mkdir /usr/notebooks

ADD startup.sh ./

CMD ["/spark/startup.sh"]

EXPOSE 7077
EXPOSE 8080
EXPOSE 8889
