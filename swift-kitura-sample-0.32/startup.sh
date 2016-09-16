#!/bin/sh
cd $KITURA_SAMPLE_HOME
mkdir -p ./Packages
nodemon -L --watch ./ --ext swift --ignore ./Packages --exec "swift build && ./.build/debug/KituraSample"