FROM markwatsonatx/spark-notebook:2.1.1

RUN apk update && \
    apk add libc6-compat && \
    apk add freetype-dev && \
    apk add openblas-dev && \
    pip3 install matplotlib && \
    pip3 install numpy && \
    pip3 install scipy && \
    pip3 install scikit-learn && \
    pip3 install watson-machine-learning-client
