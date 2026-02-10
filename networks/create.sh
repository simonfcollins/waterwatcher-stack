#!/bin/bash

sudo docker network create --driver overlay --internal internal
sudo docker network create --driver overlay outbound