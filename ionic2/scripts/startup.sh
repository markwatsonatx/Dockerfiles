#!/bin/sh
rm -rf node_modules
npm install
http-server -p 8100 ./www &
nodemon -L --watch ./app --ext ts,js,scss --exec "ionic build"