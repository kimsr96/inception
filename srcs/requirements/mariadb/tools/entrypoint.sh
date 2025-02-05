#!/bin/bash
set -e

mysqld

until mysqladmin ping --silent; do
    sleep 1
    echo "Waiting for MariaDB to start..."
done

mysql -uroot << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

#cat /var/www/initial.sql


#sleep 5
#service mariadb stop

#mysqld