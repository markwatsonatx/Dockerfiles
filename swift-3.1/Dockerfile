FROM ubuntu:16.04
MAINTAINER Mark Watson <markwatsonatx@gmail.com>

# Install related packages
RUN apt-get update && \
    apt-get install -y wget clang libicu-dev libcurl4-openssl-dev libssl-dev
 #   clang libedit-dev python2.7 python2.7-dev libicu-dev rsync libxml2 git curl libcurl4-openssl-dev libssl-dev uuid-dev && \
 #   apt-get clean && \
 #   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift


# Install Swift Ubuntu 16.04 Snapshot
RUN SWIFT_ARCHIVE_NAME=swift-3.1-RELEASE-ubuntu16.04 && \
    SWIFT_URL=https://swift.org/builds/swift-3.1-release/ubuntu1604/swift-3.1-RELEASE/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Set Swift Path
ENV PATH /usr/bin:$PATH

# Print Installed Swift Version
RUN swift --version
