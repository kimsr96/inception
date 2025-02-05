DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yml

up :
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build -d

down : 
	docker-compose -f $(DOCKER_COMPOSE_FILE) down -v

re :
	make down
	make up