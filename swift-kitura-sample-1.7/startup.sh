#!/bin/sh
cd $KITURA_SAMPLE_HOME
mkdir -p ./Packages
swift build
./.build/debug/Kitura-Sample &
while inotifywait -r ./Sources ./Package.swift -e create,modify,delete; do
	pkill Kitura-Sample
	swift build
	./.build/debug/Kitura-Sample &
done
