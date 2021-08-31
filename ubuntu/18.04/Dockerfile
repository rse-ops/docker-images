FROM ubuntu:18.04@sha256:9bc830af2bef73276515a29aa896eedfa7bdf4bdbc5c1063b4c457a4bbb8cd79

LABEL maintainer="Josh Essman <essman1@llnl.gov>, @vsoch"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
      wget \
      python3-dev \
      python3-pip \
      build-essential \
      sudo \
      git \
      vim \
      dh-autoreconf \
      ninja-build \
      ca-certificates \
      valgrind

# Install cmake 3.18
RUN wget -q --no-check-certificate https://cmake.org/files/v3.18/cmake-3.18.0-Linux-x86_64.tar.gz && \
    tar -xzf cmake-3.18.0-Linux-x86_64.tar.gz && \
    rm -r cmake-3.18.0-Linux-x86_64/share/vim/vimfiles && \
    cp -fR cmake-3.18.0-Linux-x86_64/* /usr && \
    rm -rf cmake-3.18.0-Linux-x86_64 && \
    rm cmake-3.18.0-Linux-x86_64.tar.gz
