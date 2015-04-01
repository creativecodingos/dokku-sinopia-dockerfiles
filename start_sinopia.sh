#!/bin/bash
if [ ! -f config.yaml ]; then
  node /opt/sinopia/generate_configuration.js
  sed -e 's/\#listen\: localhost/listen\: 0.0.0.0/' /tmp/config.yaml > /var/sinopia/config.yaml
fi
cat /var/sinopia/config.yaml
node /var/sinopia/node_modules/sinopia/bin/sinopia --config /var/sinopia/config.yaml
