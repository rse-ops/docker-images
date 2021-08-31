FROM ubuntu:16.04@sha256:454054f5bbd571b088db25b662099c6c7b3f0cb78536a2077d54adc48f00cd68

# docker build -t ghcr.io/llnl/radiuss-docker/ubuntu:<version> .

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

LABEL maintainer="David Beckingsale <david@llnl.gov>,@vsoch"

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends wget \
      python-dev \ 
      python3-pip \
      build-essential \
      sudo \
      git \
      vim \
      dh-autoreconf \
      ninja-build \
      ca-certificates \
      valgrind

# install updated Cmake for this platform
RUN wget -q --no-check-certificate https://cmake.org/files/v3.10/cmake-3.10.1-Linux-x86_64.tar.gz && \
    tar -xzf cmake-3.10.1-Linux-x86_64.tar.gz && \
    cp -fR cmake-3.10.1-Linux-x86_64/* /usr && \
    rm -rf cmake-3.10.1-Linux-x86_64 && \
    rm cmake-3.10.1-Linux-x86_64.tar.gz
