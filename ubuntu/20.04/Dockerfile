FROM ubuntu:20.04@sha256:9d6a8699fb5c9c39cf08a0871bd6219f0400981c570894cd8cbea30d3424a31f

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch"

ARG uptodate_github_commit_spack__spack__develop=c0122242ee90f0fe37edceb8d25f5ebd4a48cf19
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
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
      xsltproc \
      gnupg2

# Install Clingo for Spack
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install clingo

# Install spack
WORKDIR /opt
RUN git clone https://github.com/spack/spack && \
    cd spack && \
    git reset --hard ${spack_commit}
ENV PATH=/opt/spack/bin:$PATH

# Use the autamus build cache for maybe faster install?
RUN pip install botocore boto3 && \
    spack mirror add autamus s3://autamus-cache && \
    curl http://s3.amazonaws.com/autamus-cache/build_cache/_pgp/FFEB24B0A9D81F6D5597F9900B59588C86C41BE7.pub > key.pub && \
    spack gpg trust key.pub

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \
    # Install a new CMake
    spack install cmake@3.20.4

RUN spack view symlink /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH
