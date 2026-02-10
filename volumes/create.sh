#!/bin/bash

sudo docker volume create certbot-etc
sudo docker volume create certbot-web
sudo docker volume create pgdata
sudo docker volume create hrrr-data