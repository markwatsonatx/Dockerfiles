#!/bin/sh
/usr/local/bin/dockerd-entrypoint.sh --registry-mirror=$DC_REGISTRY_MIRROR &
git clone $DC_GIT_REPO /dc
cd /dc
docker-compose up -d
docker run -d -v /dc:/dc -e DC_DIR="/dc" -p$DC_FILE_BROWSER_PORT:3000 markwatsonatx/dind-file-browser:latest
docker run -d --add-host=dind:`ip route show | grep docker0 | awk '{print $5}'` -p$DC_PROXY_PORT:3000 markwatsonatx/dind-proxy:latest
while true; do sleep 1000; done
