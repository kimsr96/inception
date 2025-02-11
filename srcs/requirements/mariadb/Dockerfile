FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install mariadb-server \
    tini

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

RUN sed -i 's/^bind-address.*/# bind-address = 127.0.0.1/' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]

CMD ["mysqld"]