FROM ubuntu:18.04@sha256:4c0a663294764ea91ff066c19105a23c21b73f3c8aee66dc32428408e7c4632e

LABEL maintainer="Josh Essman <essman1@llnl.gov>, @vsoch"

ARG uptodate_github_commit_spack__spack__develop=b9bb303063299ba512a19168d1635172edb0e944
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

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

# Find packages already installed on system, e.g. autoconf and install cmake
RUN spack external find && \
    spack config add 'packages:all:target:[x86_64]' && \
    spack install cmake@3.20.4

RUN spack view --dependencies no symlink --ignore-conflicts /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH

RUN spack external find cmake && \
    spack config add 'packages:cmake:buildable:False'