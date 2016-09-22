FROM markwatsonatx/swift:DEVELOPMENT-SNAPSHOT-2016-05-03-a
MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get update
RUN apt-get install -y inotify-tools
RUN apt-get -y install autoconf libtool libkqueue-dev libkqueue0 libdispatch-dev libdispatch0 libcurl4-openssl-dev libbsd-dev
RUN git clone -b experimental/foundation https://github.com/apple/swift-corelibs-libdispatch.git
RUN cd swift-corelibs-libdispatch && git submodule init && git submodule update && sh ./autogen.sh && ./configure --with-swift-toolchain=/usr --prefix=/usr && make && make install

RUN mkdir /kitura-sample
WORKDIR /kitura-sample
ADD src ./
ADD startup.sh ./

ENV KITURA_SAMPLE_HOME /kitura-sample

CMD ["/kitura-sample/startup.sh"]

EXPOSE 8090