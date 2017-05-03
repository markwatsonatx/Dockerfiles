FROM docker:dind

RUN apk update
RUN apk add bash
#RUN apk add bash-doc
#RUN apk add bash-completion
RUN apk add py-pip
RUN pip install docker-compose
RUN apk add git
#RUN apk add nodejs

#ADD startup.sh /
#ADD proxy /proxy

#ENTRYPOINT ["/startup.sh"]
#CMD [""]
