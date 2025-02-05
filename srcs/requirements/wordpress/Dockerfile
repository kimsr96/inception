FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-cli \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    wget \
    netcat \
    curl \
    tini

RUN mkdir -p /var/www/html /run/php && \
    chown -R www-data:www-data /run/php

RUN sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp-config.php /var/www/html/my-config.php
COPY ./tools/setup.sh /usr/local/bin/setup.sh

RUN chmod +x /usr/local/bin/setup.sh

CMD ["/usr/bin/tini", "--", "/usr/local/bin/setup.sh"]