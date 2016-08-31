FROM markwatsonatx/swift:DEVELOPMENT-SNAPSHOT-2016-08-23-a
MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get update
RUN apt-get install -y nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get install -y npm
RUN npm install -g nodemon

RUN mkdir /kitura-sample
WORKDIR /kitura-sample
ADD src ./
ADD startup.sh ./

ENV KITURA_SAMPLE_HOME /kitura-sample/src

CMD ["/kitura-sample/startup.sh"]

EXPOSE 8090