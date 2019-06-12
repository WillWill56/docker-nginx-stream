FROM nginx:latest
MAINTAINER William Lees <willwill56@gmail.com>

USER root

COPY append-to-nginx.conf /etc/nginx/
RUN cat /etc/nginx/append-to-nginx.conf >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/append-to-nginx.conf

RUN mkdir /etc/nginx/stream.d
