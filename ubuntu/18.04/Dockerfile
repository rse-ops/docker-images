FROM ubuntu:18.04@sha256:9bc830af2bef73276515a29aa896eedfa7bdf4bdbc5c1063b4c457a4bbb8cd79

LABEL maintainer="Josh Essman <essman1@llnl.gov>, @vsoch"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
      wget \
      python3-dev \
      python3-pip \
      build-essential \
      sudo \
      git \
      vim \
      dh-autoreconf \
      ninja-build \
      ca-certificates \
      valgrind

# Install spack
RUN git clone --depth 1 https://github.com/spack/spack /opt/spack
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \

    # Install a new CMake (used to be 3.18.0)
    spack install cmake@3.20.4
