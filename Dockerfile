# Airfield app

FROM ubuntu:12.04
MAINTAINER Nick Stinemates, Thatcher Peskens

RUN apt-get -y update
RUN apt-get -y install python-software-properties git build-essential
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -y update
RUN apt-get -y install nodejs

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /airfield && cp -a /tmp/node_modules /airfield/

WORKDIR /airfield
ADD . /airfield

EXPOSE 3000

CMD ["node", "/airfield/airfield.js"]
