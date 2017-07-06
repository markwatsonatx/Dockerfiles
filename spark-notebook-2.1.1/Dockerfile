FROM markwatsonatx/spark:2.1.1

WORKDIR /usr/local

RUN apk update && \
    apk add python3-dev && \ 
    apk add build-base && \
    python3 -m ensurepip && \ 
    pip3 install --upgrade pip && \
    pip3 install jupyter

# Install Scala
ENV SCALA_VERSION=2.11.11 \
    SCALA_HOME=/usr/share/scala

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash && \
    cd "/tmp" && \
    wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies && \
    rm -rf "/tmp/"*

# Install SBT
ENV SBT_VERSION=0.13.15 \
    SBT_HOME=/usr/share/sbt

RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash && \
    cd "/tmp" && \
    wget "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" && \
    tar xzf sbt-${SBT_VERSION}.tgz && \
    mkdir ${SBT_HOME} && \
    mv "/tmp/sbt/bin" "${SBT_HOME}/" && \
    mv "/tmp/sbt/conf" "${SBT_HOME}/" && \
    mv "/tmp/sbt/lib" "${SBT_HOME}/" && \
    ln -s "${SBT_HOME}/bin/"* "/usr/bin/" && \
    rm -rf "/tmp/"*

# Install Apache Toree
RUN mkdir /usr/local/apache-toree
WORKDIR /usr/local/apache-toree
RUN apk add --no-cache git && \
    git clone https://github.com/apache/incubator-toree.git 
WORKDIR /usr/local/apache-toree/incubator-toree 
RUN SCALA_VERSION=2.11 make clean release APACHE_SPARK_VERSION=2.1.1 || true
WORKDIR /usr/local/apache-toree/incubator-toree/dist/toree-pip/
RUN python3 setup.py install && \
    jupyter toree install --spark_home=$SPARK_HOME


FROM markwatsonatx/spark:2.1.1

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

RUN apk update && \
    apk add python3-dev && \
    apk add build-base && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install jupyter

# Configure and copy Scala
ENV SCALA_HOME=/usr/share/scala
COPY --from=0 ${SCALA_HOME} ${SCALA_HOME} 
RUN ln -s "${SCALA_HOME}/bin/"* "/usr/bin/"

# Copy Apache Toree
COPY --from=0 /usr/local/share/jupyter/kernels/apache_toree_scala /usr/local/share/jupyter/kernels/apache_toree_scala

# Add notebooks, etc.
RUN mkdir /usr/notebooks

# Add kernels
WORKDIR /usr/local/share/jupyter/kernels
RUN mkdir pyspark
ADD pyspark ./pyspark

RUN mkdir /root/.jupyter/
WORKDIR /root/.jupyter/
ADD jupyter_notebook_config.py ./

WORKDIR /
ADD startup.sh ./

CMD ["/startup.sh"]

EXPOSE 8889
