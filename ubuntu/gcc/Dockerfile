ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install gcc with spack
ARG gcc_version
ARG JOBS=2
ENV gcc_version=$gcc_version \
    gcc_spec="gcc@${gcc_version}+bootstrap+strip+binutils languages=c,c++,fortran,lto" \
    COMPILER_NAME=gcc \
    COMPILER_VERSION=$gcc_version \
    CC=/opt/view/bin/gcc \
    CXX=/opt/view/bin/g++ \
    FC=/opt/view/bin/gfortran \
    CPP=/opt/view/bin/cpp

RUN apt-get -qq update \
 && apt-get -qq install -y --no-install-recommends texinfo gawk \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean

# build compiler and set defaults
# note the IFS to split the spec, spack can't tolerate a single-string spec with
# multiple flags components apparently
RUN spack external find hwloc ncurses texinfo gawk \
 && EXTRA_LANG=$(bash -c "[[ ${gcc_version} > 5 ]] && echo ',jit'" || true) \
 && spack spec --reuse ${gcc_spec}$EXTRA_LANG "^binutils@2.38:" \
 && spack -v install --jobs $JOBS --deprecated --reuse ${gcc_spec} \
 && spack compiler add \
 && spack config add "packages:all:compiler:[${COMPILER_NAME}@${COMPILER_VERSION}]" \
 && update-alternatives --install /usr/bin/cc cc ${CC} 50 \
 && update-alternatives --install /usr/bin/c++ c++ ${CXX} 50 \
 && update-alternatives --install /usr/bin/gcc gcc ${CC} 50 \
 && update-alternatives --install /usr/bin/g++ g++ ${CXX} 50 \
 && update-alternatives --install /usr/bin/gfortran gfortran ${FC} 50 \
 && update-alternatives --install /usr/bin/f77 f77 ${FC} 50 \
 && update-alternatives --install /usr/bin/f95 f95 ${FC} 50 \
 && update-alternatives --install /usr/bin/cpp cpp ${CPP} 50 \
 && update-alternatives --install /usr/bin/c89 c89 ${CC} 50 \
 && update-alternatives --install /usr/bin/c99 c99 ${CC} 50


