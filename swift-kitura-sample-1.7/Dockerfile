FROM markwatsonatx/swift:3.1
MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get update
RUN apt-get install -y inotify-tools

RUN mkdir /kitura-sample
WORKDIR /kitura-sample
ADD src ./src
ADD startup.sh ./ 

ENV KITURA_SAMPLE_HOME /kitura-sample/src

CMD ["/kitura-sample/startup.sh"]

EXPOSE 8090
