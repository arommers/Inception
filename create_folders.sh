#!/bin/bash
mkdir inception
mkdir inception/srcs
touch inception/Makefile
mkdir inception/srcs/requirements
touch inception/srcs/docker-compose.yml
touch inception/srcs/.env

echo "DOMAIN_NAME=arommers.42.fr" > inception/srcs/.env
echo "CERT_=./requirements/tools/arommers.42.fr.crt" >> inception/srcs/.env
echo "KEY_./requirements/tools/arommers.42.fr.key" >> inception/srcs/.env
echo "DB_NAME=wordpress" >> inception/srcs/.env
echo "DB_ROOT=rootpass" >> inception/srcs/.env
echo "DB_USER=wpuser" >> inception/srcs/.env
echo "DB_PASS=wppass" >> inception/srcs/.env

mkdir inception/srcs/requirements/bonus
mkdir inception/srcs/requirements/mariadb
mkdir inception/srcs/requirements/mariadb/conf
touch inception/srcs/requirements/mariadb/conf/create_db.sh
mkdir inception/srcs/requirements/mariadb/tools
echo "" > inception/srcs/requirements/mariadb/tools/.gitkeep
touch inception/srcs/requirements/mariadb/Dockerfile
touch inception/srcs/requirements/mariadb/.dockerignore
echo ".git" > inception/srcs/requirements/mariadb/.dockerignore
echo ".env" >> inception/srcs/requirements/mariadb/.dockerignore

mkdir inception/srcs/requirements/nginx
mkdir inception/srcs/requirements/nginx/conf
touch inception/srcs/requirements/nginx/conf/nginx.conf
mkdir inception/srcs/requirements/nginx/tools
touch inception/srcs/requirements/nginx/Dockerfile
touch inception/srcs/requirements/nginx/.dockerignore
echo ".git" > inception/srcs/requirements/nginx/.dockerignore
echo ".env" >> inception/srcs/requirements/nginx/.dockerignore

mkdir inception/srcs/requirements/tools

mkdir inception/srcs/requirements/wordpress
mkdir inception/srcs/requirements/wordpress/conf
touch inception/srcs/requirements/wordpress/conf/wp-config-create.sh
mkdir inception/srcs/requirements/wordpress/tools
echo "" > inception/srcs/requirements/wordpress/tools/.gitkeep
touch inception/srcs/requirements/wordpress/Dockerfile
touch inception/srcs/requirements/wordpress/.dockerignore
echo ".git" > inception/srcs/requirements/wordpress/.dockerignore
echo ".env" >> inception/srcs/requirements/wordpress/.dockerignore
