FROM alpine:latest

RUN apk update
RUN apk add bash
RUN apk add nodejs

ADD file-browser /file-browser

CMD ["node","/file-browser/index.js"]
