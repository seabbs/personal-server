#!/bin/bash

## Get secrets from google cloud containers
bash get_from_bucket.sh
## Create a docker network to link containers
docker network create shinyproxy-net
## Pull all required images - errors are from containers that need to be built
docker-compose -f containers/docker-compose.yml pull --ignore-pull-failures
## Build all custom images
docker-compose -f containers/docker-compose.yml build
## Launch required control containers
docker-compose up
