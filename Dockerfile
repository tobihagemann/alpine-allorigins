FROM node:8.12.0-alpine
MAINTAINER Tobias Hagemann <tobias.hagemann@gmail.com>

RUN set -ex && apk add --no-cache curl \
  && cd /tmp \
  && curl -fSL https://github.com/gnuns/AllOrigins/archive/master.tar.gz -o allorigins.tar.gz \
  && tar xzf allorigins.tar.gz \
  && mkdir /app \
  && mv AllOrigins-master/* /app

WORKDIR /app
RUN npm install

CMD ["node", "server.js"]

EXPOSE 1458
