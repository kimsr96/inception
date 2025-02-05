#!/bin/sh
# WordPress 설정 파일 확인

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "WordPress already configured."
else
    echo "Setting up WordPress..."

    # wp-cli 다운로드 및 설치
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    # WordPress 다운로드
    wp core download --path=$WP_PATH --allow-root

    mv /var/www/html/my-config.php /var/www/html/wp-config.php
    
    wp core install \
            --path=$WP_PATH \
            --url=$WP_URL \
            --title=$WP_TITLE \
            --admin_user=$WP_ADMIN_USER \
            --admin_password=$WP_ADMIN_PASSWORD \
            --admin_email=$WP_ADMIN_EMAIL \
            --skip-email \
            --allow-root

    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
    
    # 추가 사용자 생성
    wp user create $WP_USER $WP_USER_EMAIL \
        --role=author \
        --path=$WP_PATH \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root
fi

# PHP-FPM 실행
exec php-fpm7.4 -F
