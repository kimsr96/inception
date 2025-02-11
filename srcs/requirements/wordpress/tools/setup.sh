#!/bin/sh

if [ ! -f $WP_PATH/wp-config.php ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --path=$WP_PATH --allow-root

    chown -R www-data:www-data $WP_PATH
    chmod -R 755 $WP_PATH

    cd /var/www/html

    wp config create \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="$WP_HOST" \
        --allow-root 
    
    wp core install \
            --path="$WP_PATH" \
            --url="$WP_URL" \
            --title="$WP_TITLE" \
            --admin_user="$WP_ADMIN_USER" \
            --admin_password="$WP_ADMIN_PASSWORD" \
            --admin_email="$WP_ADMIN_EMAIL" \
            --skip-email \
            --allow-root

    wp user create $WP_USER $WP_USER_EMAIL \
        --role=author \
        --path=$WP_PATH \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root
fi

exec "$@"