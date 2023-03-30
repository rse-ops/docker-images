FROM alpine:3.14@sha256:0f2d5c38dd7a4f4f733e688e3a6733cb5ab1ac6e3cb4603a5dd564e5bfb80eed

LABEL maintainer="@vsoch"

ENV TZ=America/Los_Angeles

RUN apk update && \
    apk add git python3 clingo \
        g++ \
        bash \
        make \ 
        patch \
        linux-headers && \
    ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools

# Install spack
RUN git clone --depth 1 https://github.com/spack/spack /opt/spack
ENV PATH=/opt/spack/bin:$PATH

# Find packages already installed on system, e.g. autoconf
RUN spack external find # && \
# commented out to make build faster for debugging, will uncomment
#    spack install cmake@3.20.4
