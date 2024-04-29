FROM	debian:bullseye

RUN	apt-get update && apt-get install -y mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

COPY	./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	./requirements/mariadb/tools/mariadb_setup.sh /mariadb_setup.sh

RUN	chmod +x /mariadb_setup.sh

EXPOSE	3306

CMD	["/mariadb_setup.sh"]
