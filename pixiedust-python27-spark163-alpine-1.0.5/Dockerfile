FROM java:openjdk-8u111-jre-alpine

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apk add --no-cache bash \
    python-dev \ 
    build-base \
    freetype-dev \
    libxml2-dev \
    libxslt-dev
    
RUN python -m ensurepip \
  && pip install --upgrade pip \
  && pip install jupyter \
  && pip install bokeh \
  && pip install matplotlib \
  && pip install pandas \
  && pip install requests

RUN mkdir /root/.jupyter/
WORKDIR /root/.jupyter/
COPY jupyter_notebook_config.py ./

RUN mkdir -p /root/pixiedust/bin \
  && pip install pixiedust==1.0.5 \
  && jupyter pixiedust install --silent --spark=1.6.3 \
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
