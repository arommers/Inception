#!/bin/bash

#starting mariadb service
#service mariadb start

#create SQL file and echo SQL commands into the file
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db_file.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$USERP';" >> db_file.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$USERP';" >> db_file.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOTP';" >> db_file.sql
echo "FLUSH PRIVILEGES;" >> db_file.sql

mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db --skip-name-resolve --auth-root-authentication-method=normal

service mariadb start
mysql < db_file.sql
service mariadb stop

#service mariadb start

mysqld_safe