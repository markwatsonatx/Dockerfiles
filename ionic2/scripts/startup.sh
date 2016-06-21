#!/bin/sh
rm -rf node_modules
npm install
ionic build
http-server -p 8100 ./www &
nodemon -L ./app/ --exec "ionic build"