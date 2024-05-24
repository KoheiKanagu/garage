FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa

ARG FLUTTER_VERSION
RUN test -n "$FLUTTER_VERSION"

ARG USERNAME=flutteruser

RUN useradd -ms /bin/bash $USERNAME
USER $USERNAME
WORKDIR /home/$USERNAME

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git
WORKDIR /home/$USERNAME/flutter
RUN git checkout $FLUTTER_VERSION

ENV PATH $PATH:/home/$USERNAME/flutter/bin:/home/$USERNAME/.pub-cache/bin

RUN flutter precache
RUN flutter doctor --verbose

# Install global Dart packages
RUN dart pub global activate melos
RUN dart pub global activate grinder
RUN dart pub global activate flutterfire_cli
