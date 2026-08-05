#!/bin/bash

set -e

echo "Tearing down all stacks"

docker stack rm hrrr
docker stack rm core
docker stack rm data

echo "Services successfully terminated"