FROM alpine:3.14@sha256:cf5b2ed6e37873edf0733ad18ca3ccc414a60ba260be611459c245508a19b652

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
