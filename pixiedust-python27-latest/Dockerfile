FROM markwatsonatx/pixiedust-base-python27:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apt-get install -y git

WORKDIR /
RUN git clone https://github.com/ibm-cds-labs/pixiedust 

WORKDIR /pixiedust
RUN pip install -e ./
RUN jupyter pixiedust install --silent --spark=1.6.3
RUN jupyter pixiedust install --silent --spark=2.0.2
RUN jupyter pixiedust install --silent --spark=2.1.0
RUN cp notebook/Intro\ to\ PixieDust.ipynb /usr/notebooks
RUN cp notebook/Intro\ to\ PixieDust\ Spark\ 2.0.ipynb /usr/notebooks
