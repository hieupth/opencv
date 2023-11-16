FROM balenalib/raspberrypi3-ubuntu-python:3.10

ARG OPENCV_VERSION
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/build
# Install packages.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    # install packages.
    apt-get install -y --no-install-recommends \
      unzip build-essential cmake pkg-config checkinstall yasm \
      # to work with images
      libjpeg-dev libtiff-dev libpng-dev libtiff5-dev \
      # to work with videos
      libavcodec-dev libavformat-dev libswscale-dev \
      libxine2-dev libv4l-dev
