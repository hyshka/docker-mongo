.PHONY: build

SHELL := /bin/bash
CONTAINERNAME=mongo

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Bring the container up
	docker-compose up

down: ## Stop the container
	docker-compose stop || echo 'No container to stop'

enter: ## Enter the running container
	docker exec -it $(CONTAINERNAME) /bin/bash

clean: ## Remove the image and any stopped containers
	docker-compose down || echo 'No container to remove'
