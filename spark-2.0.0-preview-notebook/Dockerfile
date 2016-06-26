FROM markwatsonatx/spark:2.0.0-preview

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

WORKDIR /spark

RUN apt-get -y install bzip2
RUN wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh
RUN bash Anaconda3-4.0.0-Linux-x86_64.sh -b -p /anaconda

ENV PATH "/anaconda/bin:$PATH"

RUN mkdir /usr/notebooks

ADD scripts/startup.sh ./

CMD ["/spark/startup.sh"]

EXPOSE 7077
EXPOSE 8080
EXPOSE 8889