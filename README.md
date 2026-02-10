# WaterWatcher Docker Swarm Stack
This repository contains modular Docker Swarm stack files and documentation for deploying the WaterWatcher application.

## Info
This is a **single-node Docker Swarm application** and does not currently support horizontal scaling across worker nodes.

## Setup
1. Install the official Docker Engine packages for your platform from https://docs.docker.com/engine/install/
2. Connect Docker to the the GitHub Container Repository with `echo "YOUR_GITHUB_TOKEN" | docker login ghcr.io -u simonfcollins --password-stdin`
3. Initialize the swarm with `sudo docker swarm init`.
4. Run the [network creation script](networks/create.sh) to create the internal and outbound Docker networks.
5. Run the [volume creation script](volumes/create.sh) to create the certbot-etc, certbot-web, pgdata, and hrrr-data persistent volumes.
6. Follow the Docker secrets [setup instructions](secrets/README.md).

## Deployment
1. Run the [deploy script](lifecycle/deploy.sh).

## Teardown
1. Run the [teardown script](lifecycle/teardown.sh).