FROM debian:bullseye

RUN	apt-get update && apt-get install -y nginx openssl && \
	mkdir -p /etc/nginx/ssl && \
	chmod 700 /etc/nginx/ssl

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=NL/L=Amsterdam/O=CODAM/OU=student/CN=arommers.42.fr"

COPY ./requirements/nginx/tools/index.html /var/www/html

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
