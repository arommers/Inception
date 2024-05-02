all: install up

up:
	@docker-compose -f  ./srcs/docker-compose.yml up -d

build:
	@docker-compose -f ./srcs/docker-compose up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

clean: stop
	@rm -rf /home/arommers/data/mariadb/*
	@rm -rf /home/arommers/data/wordpress/*
	@docker system prune -af
	@$(MAKE) uninstall

install:
	@mkdir -p /home/arommers/data/mariadb
	@mkdir -p /home/arommers/data/wordpres

uninstall:
	@rm -rf /home/arommers/data/mariadb
	@rm -rf /home/arommers/data/wordpress

.PHONY: all up build down stop clean install uninstall
