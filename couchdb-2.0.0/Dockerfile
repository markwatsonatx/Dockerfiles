FROM debian:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get update
RUN apt-get --no-install-recommends -y install build-essential pkg-config erlang libicu-dev libmozjs185-dev libcurl4-openssl-dev wget curl jq

WORKDIR /couchdb

ADD create_db.sh ./
ADD startup.sh ./

RUN wget http://www-eu.apache.org/dist/couchdb/source/2.0.0/apache-couchdb-2.0.0.tar.gz 
RUN gunzip apache-couchdb-2.0.0.tar.gz 
RUN tar -xf apache-couchdb-2.0.0.tar 

WORKDIR /couchdb/apache-couchdb-2.0.0

RUN ./configure
RUN make release

ADD local.ini ./rel/couchdb/etc/

WORKDIR /couchdb

CMD ["./startup.sh"]

EXPOSE 5984
