FROM node:18-alpine

ARG N8N_VERSION=1.93.0

RUN apk add --update graphicsmagick tzdata

RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm install --location=global n8n@${N8N_VERSION} && \
    apk del build-dependencies

USER node

WORKDIR /home/node/.n8n

EXPOSE 5678

CMD n8n start