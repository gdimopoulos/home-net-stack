#!/bin/bash
docker network inspect web >/dev/null 2>&1 || \
  docker network create web

containers=(
	'traefik'
	'pihole'
	'prometheus'
	'pihole-exporter'
	'blackbox-exporter'
	'prometheus-speedtest'
	'smokeping'
	'watchtower'
	'grafana'
)

ACTION=$1
ARGS=""
if [[ $ACTION = "up" ]]; then
	ARGS="up -d"
elif [[ $ACTION = "down" ]]; then
	ARGS="down"
else
	echo "Specify up or down"
	exit 1
fi

for c in "${containers[@]}"; do
	docker-compose -f "$c/docker-compose.yml" $ARGS
done
