FROM axom/compilers:ubuntu-base

LABEL maintainer="David Beckingsale <david@llnl.gov>"

RUN \
       sudo apt-get -qq install -y --no-install-recommends \
         g++-7 \
    && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100 \
    && sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-7 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-7 100

USER axom
WORKDIR /home/axom
