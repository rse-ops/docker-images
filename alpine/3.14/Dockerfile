FROM alpine:3.14

LABEL maintainer="@vsoch"

ENV TZ=America/Los_Angeles

RUN apk update && \
    apk add git python3 clingo && ln -sf python3 /usr/bin/python
    python3 -m ensurepip
    pip3 install --no-cache --upgrade pip setuptools

# Install spack
RUN git clone --depth 1 https://github.com/spack/spack /opt/spack
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find && \
    spack install cmake@3.20.4
