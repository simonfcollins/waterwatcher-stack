#!/bin/bash

docker volume create certbot-etc
docker volume create certbot-web
docker volume create pgdata
docker volume create hrrr-data