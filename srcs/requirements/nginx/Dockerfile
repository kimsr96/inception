FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx \
    iputils-ping \
    openssl \
    tini

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/server_pkey.pem \
    -out /etc/ssl/certs/server.crt \
    -subj "/C=KR/ST=State/L=SEOUL/O=Org/CN=ex_server"

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["/usr/bin/tini", "--", "nginx", "-g", "daemon off;"]