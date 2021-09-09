ARG ubuntu_version
ARG cuda_version
FROM nvidia/cuda:${cuda_version}-devel-ubuntu${ubuntu_version}
LABEL maintainer="David Beckingsale <david@llnl.gov>,vsoch"

ENV cuda_version=$cuda_version
ENV CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-${cuda_version}

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
      wget \
      python3-dev
      python3-pip \
      build-essential \
      sudo \
      git \
      vim \
      dh-autoreconf \
      ninja-build \
      ca-certificates

# Install spack
RUN git clone --depth 1 https://github.com/spack/spack /opt/spack
ENV PATH=/opt/spack/bin:$PATH

# Install cmake 3.10
RUN wget -q --no-check-certificate https://cmake.org/files/v3.10/cmake-3.10.1-Linux-x86_64.tar.gz && \
    tar -xzf cmake-3.10.1-Linux-x86_64.tar.gz && \
    cp -fR cmake-3.10.1-Linux-x86_64/* /usr && \
    rm -rf cmake-3.10.1-Linux-x86_64 && \
    rm cmake-3.10.1-Linux-x86_64.tar.gz
