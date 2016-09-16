# Adapted from https://github.com/swiftdocker/docker-swift
FROM ubuntu:14.04
MAINTAINER Mark Watson <markwatsonatx@gmail.com>

#ENV SWIFT_BRANCH release
#ENV SWIFT_VERSION 3.0
#ENV SWIFT_PLATFORM ubuntu14.04
    
# Install related packages
RUN apt-get update && \
    apt-get install -y build-essential wget clang libedit-dev python2.7 python2.7-dev libicu52 rsync libxml2 git curl libcurl4-gnutls-dev uuid-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# Install Swift Ubuntu 14.04 Snapshot
RUN SWIFT_ARCHIVE_NAME=swift-3.0-RELEASE-ubuntu14.04 && \
    SWIFT_URL=https://swift.org/builds/swift-3.0-release/ubuntu1404/swift-3.0-RELEASE/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Set Swift Path
ENV PATH /usr/bin:$PATH

# Print Installed Swift Version
RUN swift --version