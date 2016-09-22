#!/bin/sh
cd $KITURA_SAMPLE_HOME
mkdir -p ./Packages
swift build -Xcc -fblocks 
./.build/debug/KituraSample &
while inotifywait -r ./Sources ./Package.swift -e create,modify,delete; do
	pkill KituraSample
	swift build -Xcc -fblocks 
	./.build/debug/KituraSample &
done