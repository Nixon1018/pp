FROM gitpod/workspace-full

# Install Flutter dependencies
USER gitpod

# Install system dependencies for Flutter Linux
RUN sudo apt-get update && sudo apt-get install -y \
  clang cmake ninja-build pkg-config libgtk-3-dev libblkid-dev liblzma-dev \
  libpq-dev libsqlite3-dev libcurl4-openssl-dev libssl-dev libjsoncpp-dev \
  libprotobuf-dev protobuf-compiler unzip xz-utils zip zlib1g-dev curl gnupg

# Install Flutter
ENV FLUTTER_HOME=/home/gitpod/flutter
RUN git clone https://github.com/flutter/flutter.git $FLUTTER_HOME
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

# Enable Flutter web
RUN flutter channel stable && flutter upgrade && flutter config --enable-web && flutter doctor
