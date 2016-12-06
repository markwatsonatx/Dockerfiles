#!/bin/sh
#rm -rf node_modules
npm install
http-server -p 8100 ./www &
nodemon -L --watch ./src/app --ext ts,js,scss --exec "npm run ionic:build"
