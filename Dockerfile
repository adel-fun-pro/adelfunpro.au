
FROM node:19-alpine3.16 as build

RUN apk add --no-cache make

RUN npm i -g sass

WORKDIR /usr/local/src/adelfunpro.au

COPY . .

RUN make

FROM nginx:stable-alpine

COPY index.html *.css index.js *.svg /usr/share/nginx/html/

COPY font/ /usr/share/nginx/html/font/
