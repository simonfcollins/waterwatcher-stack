#!/bin/bash

docker network create --driver overlay --internal internal
docker network create --driver overlay outbound