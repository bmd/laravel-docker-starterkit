# include docker/make.d/*
include .env

#############################################################
# "Public API"
#    Commands that we expect users to interact with directly
#    when developing the application
#############################################################
install: build composer
	php artisan key:generate
	php artisan ide-helper:generate
	php artisan ide-helper:meta

build: build-util
	docker-compose build

clean:
	docker rm $(COMPOSE_PROJECT_NAME)_{laravel,mysql,nginx,redis}_1

doc:
	./docker/bin/phpdoc.sh

help:
	@echo "Authentication Service Makefile Commands"
	@echo "  |"
	@echo "  |_ build      - Build the project's docker containers"
	@echo "  |_ clean      - Remove the application's docker containers"
	@echo "  |_ doc        - Generate PHPDocumentor documentation for everything in /src/Blue"
	@echo "  |_ help       - Show this message"
	@echo "  |_ install    - (default) Install and configure the docker containers for development locally"
	@echo "  |_ reset      - Like 'clean' but also removes all data associated with the cache. WARNING: this will"
	@echo "  |               destroy any seeded data."
	@echo "  |_ run        - Bring up the application and database containers in the foreground"
	@echo "  |_ start      - Bring up the application and database containers in the background"
	@echo "  |_ stop       - Bring down any running docker containers"
	@echo "  |_ test       - Run the local PHPUnit test suite inside the application container"
	@echo "  |___________________________________________________________________________________________________"
	@echo " "

reset: stop clean
	-rm -rf ./docker/containers/redis/.data
	-rm -rf ./docker/containers/mysql/.data

run:
	docker-compose up

start:
	docker-compose up -d

stop:
	docker-compose down --remove-orphans

test:
	@echo "Running tests in Docker container"
	docker exec $(COMPOSE_PROJECT_NAME)_laravel_1 phpunit

#############################################################
# "Private" Commands
#    Used as sub-commands by other Make routines, but users
#    probably won't need/want to call these directly. Not
#    included in the "help" documentation
#############################################################
composer:
	./docker/bin/composer.sh install
	./docker/bin/composer.sh dump-autoload

composer-update:
	./docker/bin/composer.sh update
	./docker/bin/composer.sh dump-autoload
    php artisan ide-helper:generate
    php artisan ide-helper:meta

build-util:
	docker build -t $(COMPOSE_PROJECT_NAME)/utility:v1 docker/containers/utility/
