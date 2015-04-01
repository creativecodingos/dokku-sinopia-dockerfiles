FROM dockerfile/nodejs

MAINTAINER Giacomo Triggiano <giacomo@creativecoding.it>

RUN adduser --disabled-password --gecos "Sinopia NPM mirror" sinopia

RUN mkdir -p /var/sinopia/storage
WORKDIR /var/sinopia

RUN npm install js-yaml sinopia
RUN chown -R sinopia:sinopia /opt/sinopia

USER sinopia

ADD /generate_configuration.js /var/sinopia/generate_configuration.js
ADD /start_sinopia.sh /var/sinopia/start.sh

EXPOSE 4873
VOLUME /var/sinopia

CMD ["/var/sinopia/start.sh"]
