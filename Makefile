DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml

up :
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build -d

down : 
	docker compose -f $(DOCKER_COMPOSE_FILE) down -v && \
	sudo rm -rf /home/seungryk/data/* && \
	mkdir /home/seungryk/data/wp && \
	mkdir /home/seungryk/data/db
re :
	make down
	make up