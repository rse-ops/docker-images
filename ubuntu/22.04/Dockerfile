FROM ubuntu:22.04@sha256:a02c32cf0c2a7e8743c74deef66637aa70e063c9bd40e9e1f8c0b3ea0750b0ba

LABEL maintainer="@vsoch"

ARG uptodate_github_commit_spack__spack__develop=84854741407e416d3d5abd787013c97a832c0027
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
      python3-dev \
      sudo \
      valgrind \
      vim-nox \
      wget \
      xsltproc \
      ncurses-bin \
      libncurses-dev \
      libbinutils \
      binutils-dev \
      hwloc-nox \
      libhwloc-dev \
      && rm -rf /var/lib/apt/lists/* \
      && apt-get clean

# Install Clingo for Spack
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install clingo

# Install spack
WORKDIR /opt
RUN git clone https://github.com/spack/spack spack && \
    cd spack && \
    git reset --hard ${spack_commit}

ENV PATH=/opt/spack/bin:$PATH

# Use the autamus build cache for maybe faster install?
RUN python3 -m pip install botocore boto3 && \
    spack mirror add autamus s3://autamus-cache && \
    curl http://s3.amazonaws.com/autamus-cache/build_cache/_pgp/FFEB24B0A9D81F6D5597F9900B59588C86C41BE7.pub > key.pub && \
    spack gpg trust key.pub

ENV CMAKE=3.20.4
RUN curl -s -L https://github.com/Kitware/CMake/releases/download/v$CMAKE/cmake-$CMAKE-linux-x86_64.sh > cmake.sh ; \
    bash cmake.sh --prefix=/usr/local --skip-license && \
    rm cmake.sh

# Find packages already installed on system, e.g. autoconf
RUN spack external find --all && \
    spack config add 'packages:all:target:[x86_64]' && \
    spack config add 'concretizer:reuse:true'

# Generate spack environment for packages
RUN spack env create --dir /opt/env --with-view /opt/view
# Tell spack to use this one without arguments
ENV SPACK_ENV=/opt/env
# Add appropriate paths pointing to the view
ENV PATH=/opt/view/bin:$PATH
ENV MANPATH=/opt/view/share/man:$MANPATH
ENV PKG_CONFIG_PATH=/opt/view/lib/pkgconfig:/opt/view/lib64/pkgconfig:/opt/view/share/pkgconfig:$PKG_CONFIG_PATH
ENV CMAKE_PREFIX_PATH=/opt/view
ENV ACLOCAL_PATH=/opt/view/share/aclocal

RUN spack external find cmake && \
    spack config add 'packages:cmake:buildable:False' && \
    echo /opt/view/lib > /etc/ld.so.conf.d/spack_view.conf && \
    echo /opt/view/lib64 > /etc/ld.so.conf.d/spack_view.conf && \
    ldconfig
