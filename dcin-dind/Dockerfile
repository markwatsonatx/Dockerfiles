FROM docker:dind

RUN apk update
RUN apk add bash
RUN apk add py-pip
RUN pip install docker-compose
RUN apk add git

ADD dcin-dind-entrypoint.sh /

ENTRYPOINT ["/dcin-dind-entrypoint.sh"]
