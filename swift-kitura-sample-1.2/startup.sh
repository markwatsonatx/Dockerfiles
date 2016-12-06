#!/bin/sh
cd $KITURA_SAMPLE_HOME
mkdir -p ./Packages
swift build
./.build/debug/KituraSample &
while inotifywait -r ./Sources ./Package.swift -e create,modify,delete; do
	pkill KituraSample
	swift build
	./.build/debug/KituraSample &
done