FROM continuumio/anaconda3:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get -y install oracle-java8-installer

RUN pip install --upgrade pip

RUN mkdir /usr/notebooks

RUN mkdir /root/.jupyter/
WORKDIR /root/.jupyter/
ADD jupyter_notebook_config.py ./

WORKDIR /home/root
ADD startup.sh ./

CMD ["/home/root/startup.sh"]
