FROM axom/compilers:ubuntu-20-base_latest

LABEL maintainer="Josh Essman <essman1@llnl.gov>"

RUN \
       sudo apt-get -qq install -y --no-install-recommends \
         g++-9 \
    && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100 \
    && sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-9 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-9 100

USER axom
WORKDIR /home/axom
