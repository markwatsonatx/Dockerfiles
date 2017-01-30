FROM markwatsonatx/pixiedust-base:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get install -y git

WORKDIR /
RUN git clone -b install https://github.com/ibm-cds-labs/pixiedust 

WORKDIR /pixiedust
RUN pip install -e ./
RUN jupyter pixiedust install --silent

WORKDIR /home/root
ADD startup.sh ./

CMD ["/home/root/startup.sh"]

EXPOSE 8888
