#!/bin/bash

cd /var/lib/mysql

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

	if [ ! -f db.sql ]; then

		echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db.sql
		echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" >> db.sql
		echo "ALTER USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" >> db.sql
		echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';" >> db.sql
		echo "FLUSH PRIVILEGES;" >> db.sql
	fi

#	mariadb-install-db \
#	--user=mysql \
#	--datadir=/var/lib/mysql \
#	--skip-test-db \
#	--skip-name-resolve \
#	--auth-root-authentication-method=normal

	sleep 2

	service mariadb start
	mysql < db.sql

	sleep 2
	service mariadb stop
fi

mysqld_safe
