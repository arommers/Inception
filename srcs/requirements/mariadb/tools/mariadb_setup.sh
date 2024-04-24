#!/bin/bash

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

	if [ ! -f db.sql ]; then
		echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db.sql
		echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> db.sql
		echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> db.sql
		echo "FLUSH PRIVILEGES;" >> db.sql
	fi

	service mariadb start
	mysql < db.sql
	service mariadb stop
fi

mysqld_safe
