FROM ubuntu:latest AS base

# Set up environment variables
ENV FLUTTER_BUILD_BRANCH=stable
ENV FLUTTER_SDK=/flutter
ENV PUB_CACHE="/flutter/bin/cache"
ENV PATH="/flutter/bin/:$PATH"

RUN apt-get update
RUN apt-get install -y build-essential git unzip zip sudo
RUN apt-get install -y clang cmake curl liblzma-dev libstdc++-12-dev libgtk-3-dev libglu1-mesa ninja-build pkg-config

RUN curl -sL https://firebase.tools | upgrade=true bash

# Set up Flutter
RUN git clone --branch stable --single-branch --filter=tree:0 https://github.com/flutter/flutter $FLUTTER_SDK
VOLUME $FLUTTER_SDK

# Set up Flutter
RUN flutter doctor
RUN flutter precache --web --no-android --no-ios --linux --no-windows --no-macos --no-fuchsia --no-universal

# RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# # RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc \
# #     && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
# #     && brew install gcc gh firebase-cli

# # RUN systemctl start snapd
# Set up new user
RUN useradd -ms /bin/bash developer
RUN mkdir -p $FLUTTER_SDK && chown -R developer:developer $FLUTTER_SDK && chmod -R u+w $FLUTTER_SDK

USER developer