#!/bin/sh
node /proxy/proxy.js &
/usr/local/bin/docker-entrypoint.sh sh
