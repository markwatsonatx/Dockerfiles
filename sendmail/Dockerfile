FROM debian:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get update
RUN apt-get -y install sendmail 

WORKDIR /sendmail

ADD startup.sh ./

CMD ["./startup.sh"]

EXPOSE 25
