FROM ubuntu:20.04

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update && \
    apt-get -qq install -fy tzdata && \
    apt-get -qq install -fy --no-install-recommends \
      build-essential \
      ca-certificates \
      curl \
      dh-autoreconf \
      git \
      lcov \
      ninja-build \
      pkg-config \
      python3-dev \
      python3-pip \
      sudo \
      vim \
      wget \
      xsltproc

# Install Clingo for Spack
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install clingo

# Install cmake
RUN wget -q --no-check-certificate https://cmake.org/files/v3.18/cmake-3.18.6-Linux-x86_64.tar.gz && \
    tar -xzf cmake-3.18.6-Linux-x86_64.tar.gz && \
    rm -r cmake-3.18.6-Linux-x86_64/share/vim/vimfiles && \
    cp -fR cmake-3.18.6-Linux-x86_64/* /usr && \
    rm -rf cmake-3.18.6-Linux-x86_64 && \
    rm cmake-3.18.6-Linux-x86_64.tar.gz && \
