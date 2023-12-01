#!/bin/sh
set -e

echo "Activating Flutter feature..."

apt-get update && \
    apt-get install -y unzip curl sudo git && \
    apt-get clean

git clone -b stable --depth 1 https://github.com/flutter/flutter.git /flutter

export PATH=$PATH:/flutter/bin

flutter doctor