#!/bin/bash

set -e

echo "Tearing down all stacks"

sudo docker stack rm hrrr
sudo docker stack rm core
sudo docker stack rm data
sudo docker stack rm ingress

echo "Services successfully terminated"