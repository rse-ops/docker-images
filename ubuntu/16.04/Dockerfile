FROM ubuntu:16.04

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
      libssl-dev \
      ca-certificates \
      valgrind

# Install spack
RUN git clone --depth 1 https://github.com/spack/spack /opt/spack
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \

    # Install a new CMake (used to be 3.10.1)
    spack install cmake@3.20.4
