#!/bin/bash

cd /var/www/html/

if [ ! -f ./wp-config.php ]; then 

	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_USER_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	chown -R www-data:www-data /var/www/html
	chmod -R 755 /var/www/html
	chown www-data:www-data wp-config.php
	chmod 644 wp-config.php

	wp core install --allow-root --url="$DOMAIN_NAME" --title=Inception \
        --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" --skip-email

	wp user create \
	--allow-root \
	"$WP_USER" \
	"$WP_USER_EMAIL" \
        --role=author \
	--user_pass="$WP_USER_PASSWORD"

fi

/usr/sbin/php-fpm7.4 -F
