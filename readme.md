# Laravel Docker StarterKit

### Whatis

LDSK is an attempt to solve the simple problem of creating a consistent LEMP
environment for quickly prototyping and testing web applications with Laravel and Docker.

After configuration, you should be able to interact with it as a normal laravel application.
Note that even PHP and Composer are provided as dockerized dependencies, so you don't need
either installed locally

Currently LDSK provides Laravel 5.2 and PHP 5.6. The docker environment is not highly configurable -
some settings are exposed in the `.env` file but for the most part, configurability is sacrificed for
convenience.

By default, Docker will expose the following ports:
* `8080` - nginx, entrypoint for web traffic. Can be configured via `.env`
* `3307` - mysql, should not conflict with a running local instance. Can be configured via `.env`

LDSK is not suitable for deploying to production environments, so don't say I didn't warn ya.

### 1. Dependencies

Make sure you already have the latest version of [Docker](https://www.docker.com/)
installed on your machine.

### 2. Configuration

Configure the application to run locally using Docker. Note that running `make install`
again will change the application's secret key because it also wraps `artisan key:generate`.

```bash
$ git clone git@github.com:bmd/laravel-docker-starterkit my-project-name
$ cd my-project-name
# you can make any other changes you want to the .env file here as well
$ cp .env.example .env
$ make
```

### 3. Run

Run the docker containers in the foregound with:
```bash
$ make start
```

### 4. Troubleshooting

TK...