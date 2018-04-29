FROM java:openjdk-8u111-jre-alpine

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apk add --no-cache bash \
    python3-dev \ 
    build-base \
    freetype-dev \
    libxml2-dev \
    libxslt-dev
    
RUN python3 -m ensurepip \
  && pip3 install --upgrade pip \
  && pip3 install jupyter \
  && pip3 install bokeh \
  && pip3 install matplotlib \
  && pip3 install pandas \
  && pip3 install requests

RUN mkdir /root/.jupyter/
WORKDIR /root/.jupyter/
COPY jupyter_notebook_config.py ./

RUN mkdir -p /root/pixiedust/bin \
  && pip install pixiedust==1.1.7.1 \
  && jupyter pixiedust install --silent --spark=2.0.2 \
  && mkdir /usr/notebooks \
  && cp /root/pixiedust/notebooks/*.ipynb /usr/notebooks

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk add --no-cache snappy \
    java-snappy \
    java-snappy-native
RUN mkdir -p /root/pixiedust/data/libs
RUN cp /usr/share/java/snappy-java.jar /root/pixiedust/data/libs

WORKDIR /
COPY startup.sh ./

CMD ["/startup.sh"]

EXPOSE 8888
