FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-server \
    tini

RUN sed -i 's/^bind-address.*/# bind-address = 127.0.0.1/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/entrypoint.sh /var/www/entrypoint.sh

RUN chmod +x /var/www/entrypoint.sh

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql var/run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

ENTRYPOINT ["/usr/bin/tini", "--", "sh", "/var/www/entrypoint.sh" ]