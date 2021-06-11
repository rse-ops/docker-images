FROM axom/compilers:ubuntu-base

LABEL maintainer="David Beckingsale <daivd@llnl.gov>"

RUN \
       sudo apt-get -qq install -y --no-install-recommends \
         g++-5 gfortran-5 \
    && sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 100 \
    && sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 100 \
    && sudo update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-5 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-5 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-5 100

USER axom
WORKDIR /home/axom
