FROM ruby:3.2.2-slim-bookworm@sha256:02a091c83d1aa1070c0f6fefcbd2aff58ddd3430e2d5661c6ef2142b1383349b AS base

RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa wget && rm -rf /var/lib/apt/lists/*

# Set up new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# # ============== INSTALL FLUTTER ==============
# FROM base AS flutter

# ENV FLUTTER_BUILD_BRANCH=stable
# ENV FLUTTER_SDK=/flutter
# ENV PUB_CACHE="/flutter/bin/cache"
# ENV PATH="/flutter/bin/:$PATH"

# RUN git clone --branch stable --single-branch --filter=tree:0 https://github.com/flutter/flutter $FLUTTER_SDK
# VOLUME $FLUTTER_SDK

# RUN chown -R developer:developer $FLUTTER_SDK && chmod -R u+w $FLUTTER_SDK

# USER developer

# # Set up Flutter
# RUN flutter doctor
# RUN flutter precache --web --no-android --no-ios --linux --no-windows --no-macos --no-fuchsia --no-universal

# CMD ["/bin/bash", "-c", "cd /home/developer"]

# # RUN flutter config --no-analytics  \
# #     && flutter --version \
# #     && flutter pub get


# # RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# # RUN (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.bashrc \
# #     && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
# #     && brew install gcc gh firebase-cli

# # RUN systemctl start snapd