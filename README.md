# WaterWatcher Docker Swarm Stack
This repository contains modular Docker Swarm stack files and documentation for deploying the [WaterWatcher](https://waterwatcher.sico.dev) application.
The purpose of this repository is to make deployment easy on myself. The referenced GHCR containers are private. 

## Info
This is a **single-node Docker Swarm application** and does not currently support horizontal scaling across worker nodes.

## Setup
1. [Install](https://docs.docker.com/engine/install/) the official Docker Engine packages for your platform.
2. Connect Docker to the the GitHub Container Repository:
```bash
echo "YOUR_GITHUB_TOKEN" | docker login ghcr.io -u simonfcollins --password-stdin
```
3. Initialize the swarm:
```bash
sudo docker swarm init
```
4. Run the [network creation script](networks/create.sh) to create the internal and outbound Docker networks.
5. Run the [volume creation script](volumes/create.sh) to create the pgdata and hrrr-data persistent volumes.
6. Follow the Docker secrets [setup instructions](secrets/README.md).

## Deployment
1. Navigate to the project root directory.
2. Run the following command:
```bash
chmod +x ./lifecycle/deploy.sh
```
3. Run the [deploy script](lifecycle/deploy.sh):
```bash
./lifecycle/deploy.sh
```

## Teardown
1. Navigate to the project root directory.
2. Run the following command:
```bash
chmod +x ./lifecycle/teardown.sh
```
3. Run the [teardown script](lifecycle/teardown.sh):
```bash
./lifecycle/teardown.sh
```