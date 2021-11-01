FROM ubuntu:16.04@sha256:0f71fa8d4d2d4292c3c617fda2b36f6dabe5c8b6e34c3dc5b0d17d4e704bd39c

# docker build -t ghcr.io/rse-ops/ubuntu:<version> .

ARG uptodate_github_commit_spack__spack__develop=6344d163b3c84eb65091fcc394258f3e976fedce
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

LABEL maintainer="David Beckingsale <david@llnl.gov>,@vsoch"

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      curl \
      dh-autoreconf \
      git \
      gnupg2 \
      libssl-dev \
      ninja-build \
      python-dev \ 
      python3-pip \
      python3-setuptools \
      sudo \
      valgrind \
      vim \
      wget

# Install spack
WORKDIR /opt
RUN git clone https://github.com/spack/spack && \
    cd spack && \
    git reset --hard ${spack_commit}
ENV PATH=/opt/spack/bin:$PATH

# Use the autamus build cache for maybe faster install?
RUN python3 -m pip install botocore boto3 && \
    spack mirror add autamus s3://autamus-cache && \
    curl http://s3.amazonaws.com/autamus-cache/build_cache/_pgp/FFEB24B0A9D81F6D5597F9900B59588C86C41BE7.pub > key.pub && \
    spack gpg trust key.pub

# We need to upgrade Python 3 to at least 3.7 because pkgconf has format strings! yuck
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
    apt-get install -y python3.8-distutils && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py && \
    pip3 install botocore boto3

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \
    spack config add 'packages:all:target:[x86_64]' && \
    # Install a new CMake (used to be 3.10.1)
    spack install cmake@3.20.4

RUN spack view --dependencies no symlink --ignore-conflicts /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH

RUN spack external find cmake && \
    spack config add 'packages:cmake:buildable:False'
