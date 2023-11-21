#!/usr/bin/env bash

#clean anything with same name to get rid of clashes
docker-compose down

#update older jenkins image, make sure it doesnt use cache
docker-compose build --no-cache

#run build stack
docker-compose up &
