#!/bin/bash

IMAGE_NAME=flask-app:1.0.0

mkdir -p ./db/data/
docker build -t $IMAGE_NAME app/src -f app/src/Dockerfile

docker-compose up -d
