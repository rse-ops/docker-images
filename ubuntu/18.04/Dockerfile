FROM ubuntu:18.04@sha256:bfb4cabd667790ead5c95d9fe341937f0c21118fa79bc768d51c5da9d1dbe917

LABEL maintainer="Josh Essman <essman1@llnl.gov>, @vsoch"

ARG uptodate_github_commit_spack__spack__develop=4d58661d08879bc95d12ea9888fed99ec5f4fa18
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
    spack install cmake@3.20.4 && \
    spack external find cmake && \
    spack config add 'packages:cmake:buildable:False'

RUN spack view --dependencies no symlink --ignore-conflicts /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH

RUN spack external find cmake && \
    spack config add 'packages:cmake:buildable:False'