FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

COPY ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./requirements/mariadb/tools/mariadb_setup.sh .

RUN mkdir -p /var/log/mysql

RUN chown -R mysql:mysql /var/log/mysql

RUN chmod +x mariadb_setup.sh

CMD ["./mariadb_setup.sh"]