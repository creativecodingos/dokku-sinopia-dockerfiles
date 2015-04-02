FROM dockerfile/nodejs

MAINTAINER Giacomo Triggiano <giacomo@creativecoding.it>

RUN \
  adduser --disabled-password --gecos "Sinopia NPM mirror" sinopia && \
  npm install -g sinopia && \
  mkdir -p /data/sinopia/storage && \
  chown -R sinopia:sinopia /data

WORKDIR /data

USER sinopia

EXPOSE 4873

CMD ["sinopia"]
