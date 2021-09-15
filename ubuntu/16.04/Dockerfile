FROM ubuntu:16.04@sha256:454054f5bbd571b088db25b662099c6c7b3f0cb78536a2077d54adc48f00cd68

# docker build -t ghcr.io/rse-radiuss/ubuntu:<version> .

ARG uptodate_github_spack__spack=v0.16.2
ENV spack_version=${uptodate_github_spack__spack}
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
# Install spack
WORKDIR /opt
RUN wget https://github.com/spack/spack/archive/refs/tags/${spack_version}.tar.gz && \
    tar -xzvf ${spack_version}.tar.gz && \
    rm ${spack_version}.tar.gz && \
    mkdir spack && \
    tar -xzvf ${spack_version}.tar.gz -C spack  --strip-components 1
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \

    # Install a new CMake (used to be 3.10.1)
    spack install cmake@3.20.4
