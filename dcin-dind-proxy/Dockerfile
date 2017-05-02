FROM alpine:latest

RUN apk update
RUN apk add bash
RUN apk add nodejs

ADD proxy /proxy

CMD ["node","/proxy/proxy.js"]
