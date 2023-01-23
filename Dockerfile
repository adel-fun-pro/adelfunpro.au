
FROM node:19-alpine3.16 as build

RUN apk add --no-cache make

RUN npm i -g sass

WORKDIR /usr/local/src/adelfunpro.au

COPY . .

RUN make build

FROM nginx:stable-alpine

COPY --from=build /usr/local/src/adelfunpro.au /tmp/adelfunpro

WORKDIR /tmp/adelfunpro

RUN ls

RUN cp index.html index.css font.css index.js *.svg \
	/usr/share/nginx/html/

RUN rm -r /tmp/adelfunpro

COPY font/ /usr/share/nginx/html/font/
