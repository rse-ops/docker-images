FROM alpine:3.14

LABEL maintainer="@vsoch"

ENV TZ=America/Los_Angeles

RUN apk update && \
    apk add -y git python3 && ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools && \
    python3 -m pip install clingo

# Install spack
RUN git clone --depth 1 https://github.com/spack/spack /opt/spack
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \

    # Install a new CMake
    spack install cmake@3.20.4
