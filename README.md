# WaterWatcher Docker Swarm Stack
This repository contains modular Docker Swarm stack files and documentation for deploying the WaterWatcher application.
The purpose of this repository is to make deployment easy on myself. The referenced GHCR containers are private. 

## Info
This is a **single-node Docker Swarm application** and does not currently support horizontal scaling across worker nodes.

## Setup
1. [Install](https://docs.docker.com/engine/install/) the official Docker Engine packages for your platform.
2. [Install](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/downloads/) the Cloudflared CLI.
3. Connect Docker to the the GitHub Container Repository:
```bash
echo "YOUR_GITHUB_TOKEN" | docker login ghcr.io -u simonfcollins --password-stdin
```
4. Initialize the swarm:
```bash
sudo docker swarm init
```
5. Run the [network creation script](networks/create.sh) to create the internal and outbound Docker networks.
6. Run the [volume creation script](volumes/create.sh) to create the pgdata and hrrr-data persistent volumes.
7. Follow the Docker secrets [setup instructions](secrets/README.md).
8. Run the following commands to login to Cloudflared and create a tunnel:
```bash
    cloudflared login
    cloudflared tunnel create <tunnel_name>
```
9. Replace "example@email.com" in [nginx.conf](stacks/ingress/nginx.conf) with your email:
```nginx
proxy_set_header User-Agent "waterwatcher.sico.dev (example@email.com)";
```

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