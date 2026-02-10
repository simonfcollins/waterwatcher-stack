#!/bin/bash

set -e

wait_for_service() {
  SERVICE=$1
  echo "Waiting for service $SERVICE to be healthy..."

  while true; do
    UNHEALTHY=$(docker service ps "$SERVICE" \
      --filter desired-state=running \
      --format '{{.CurrentState}}' \
      | grep -v Running || true)

    [ -z "$UNHEALTHY" ] && break
    sleep 5
  done
}

echo "Deploying WaterWatcher"
echo ""

echo "Deploying ingress stack"
sudo docker stack deploy --with-registry-auth -c ./stacks/ingress/compose.yaml ingress

for svc in $(docker stack services ingress --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "Deploying data stack"
sudo docker stack deploy --with-registry-auth -c ./stacks/data/compose.yaml data

for svc in $(docker stack services data --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "Deploying core stack"
sudo docker stack deploy --with-registry-auth -c ./stacks/core/compose.yaml core

for svc in $(docker stack services core --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "Deploying hrrr stack"
sudo docker stack deploy --with-registry-auth -c ./stacks/hrrr/compose.yaml hrrr

for svc in $(docker stack services hrrr --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "All stacks deployed - Happy fishing"
