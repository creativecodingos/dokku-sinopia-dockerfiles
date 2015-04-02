FROM dockerfile/nodejs

MAINTAINER Giacomo Triggiano <giacomo@creativecoding.it>

RUN adduser --disabled-password --gecos "Sinopia NPM mirror" sinopia

RUN npm install -g sinopia

RUN mkdir -p /data/sinopia/storage

WORKDIR /data

ADD /config.yaml /data/sinopia/config.yaml

RUN chown -R sinopia:sinopia /data/sinopia

USER sinopia

EXPOSE 4873

CMD ["sinopia"]
