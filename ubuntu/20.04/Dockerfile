FROM ubuntu:20.04@sha256:9d6a8699fb5c9c39cf08a0871bd6219f0400981c570894cd8cbea30d3424a31f

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch"

ARG uptodate_github_commit_spack__spack__develop=v0.16.2
ENV spack_version=${uptodate_github_spack__spack}
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
      libssl-dev \
      sudo \
      wget \
      xsltproc

# Install Clingo for Spack
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install clingo

# Install spack
WORKDIR /opt
RUN wget https://github.com/spack/spack/archive/refs/tags/${spack_version}.tar.gz && \
    mkdir spack && \
    tar -xzvf ${spack_version}.tar.gz -C spack  --strip-components 1 && \
    rm ${spack_version}.tar.gz
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \
    # Install a new CMake
    spack install cmake@3.20.4

RUN spack view symlink /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH