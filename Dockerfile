FROM balenalib/raspberrypi3-ubuntu-python:3.10

ARG OPENCV_VERSION=4.8.1
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/build
# Install packages.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    # install packages.
    apt-get install -y --no-install-recommends \
      wget unzip build-essential cmake pkg-config checkinstall yasm \
      # to work with images
      libjpeg-dev libtiff-dev libpng-dev libtiff5-dev \
      # to work with videos
      libavcodec-dev libavformat-dev libswscale-dev \
      libxine2-dev libv4l-dev \
    && wget --no-check-certificate https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv.zip \
    && wget --no-check-certificate https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -O opencv_contrib.zip \
    && unzip opencv.zip -d /opt && rm -rf opencv.zip \
    && unzip opencv_contrib.zip -d /opt && rm -rf opencv_contrib.zip \
