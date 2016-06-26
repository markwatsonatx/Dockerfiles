FROM node:latest

MAINTAINER Mark Watson <markwatsonatx@gmail.com>

WORKDIR /ionic2

ADD startup.sh ./

RUN npm install -g cordova 
RUN npm install -g ionic@beta
RUN npm install -g http-server
RUN npm install -g nodemon
RUN ionic start cutePuppyPics --v2

WORKDIR /ionic2/cutePuppyPics

CMD ["/ionic2/startup.sh"]

EXPOSE 8100
