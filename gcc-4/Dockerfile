FROM axom/compilers:ubuntu-base

LABEL maintainer="David Beckingsale <daivd@llnl.gov>"

RUN \
       sudo apt-get -qq install -y --no-install-recommends \
         g++-4.9 \
    && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100 \
    && sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-4.9 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.9 100

USER axom
WORKDIR /home/axom
