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
echo "Deploying data stack"
docker stack deploy --detach=false -c ./stacks/data/compose.yaml data

for svc in $(docker stack services data --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "Deploying core stack"
docker stack deploy --with-registry-auth --detach=false -c ./stacks/core/compose.yaml core

for svc in $(docker stack services core --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "Deploying hrrr stack"
docker stack deploy --with-registry-auth --detach=false -c ./stacks/hrrr/compose.yaml hrrr

for svc in $(docker stack services hrrr --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
echo "Deploying ingress stack"
docker stack deploy --detach=false -c ./stacks/ingress/compose.yaml ingress

for svc in $(docker stack services ingress --format "{{.Name}}"); do
  wait_for_service "$svc"
done

echo ""
docker service ls
echo ""

echo "All stacks deployed - Happy fishing"
