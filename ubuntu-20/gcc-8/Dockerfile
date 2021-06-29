FROM axom/compilers:ubuntu-20-base_latest

LABEL maintainer="Josh Essman <essman1@llnl.gov>"

RUN \
       sudo apt-get -qq install -y --no-install-recommends \
         g++-8 \
    && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100 \
    && sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-8 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-8 100

USER axom
WORKDIR /home/axom
