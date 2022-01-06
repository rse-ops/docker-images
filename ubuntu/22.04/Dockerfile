FROM ubuntu:22.04@sha256:f154feaf13b51d16e2b4b5575d69abc808da40c4b80e3a5055aaa4bcc5099d5b

LABEL maintainer="@vsoch"

ARG uptodate_github_commit_spack__spack__develop=a43ed9286fc99f5e9127744d914b7c09a4021836
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update && \
    apt-get -qq install -fy tzdata && \
    apt-get -qq install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      curl \
      dh-autoreconf \
      git \
      gnupg2 \
      lcov \
      libssl-dev \
      ninja-build \
      pkg-config \
      python3 \
      python3-pip \
      sudo \
      valgrind \
      vim \
      wget \
      xsltproc

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
RUN python3 -m pip install botocore boto3 && \
    spack mirror add autamus s3://autamus-cache && \
    curl http://s3.amazonaws.com/autamus-cache/build_cache/_pgp/FFEB24B0A9D81F6D5597F9900B59588C86C41BE7.pub > key.pub && \
    spack gpg trust key.pub

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \
    spack config add 'packages:all:target:[x86_64]' && \
    # Install a new CMake
    spack install cmake@3.20.4

RUN spack view --dependencies no symlink --ignore-conflicts /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH

RUN spack external find cmake && \
    spack config add 'packages:cmake:buildable:False'
