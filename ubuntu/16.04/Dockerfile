FROM ubuntu:16.04@sha256:454054f5bbd571b088db25b662099c6c7b3f0cb78536a2077d54adc48f00cd68

# docker build -t ghcr.io/rse-radiuss/ubuntu:<version> .

ARG uptodate_github_commit_spack__spack__develop=c58cd83e38402b32782bc7b1b9467770698f4113
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

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \
    # Install a new CMake (used to be 3.10.1)
    spack install cmake@3.20.4

RUN spack view --dependencies no symlink --ignore-conflicts /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH

RUN spack external find cmake && \
    spack config add 'packages:cmake:buildable:False'
