FROM markwatsonatx/flask-alpine:latest

RUN apk update && \
    apk add libc6-compat && \
    apk add freetype-dev && \
    apk add openblas-dev && \
    pip3 install matplotlib && \
    pip3 install numpy && \
    pip3 install scipy && \
    pip3 install scikit-learn
