ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install gcc with spack
ARG gcc_version
ENV gcc_version=$gcc_version \
    gcc_spec="gcc@${gcc_version}~bootstrap+binutils languages=c,c++,fortran,go,lto" \
    COMPILER_NAME=gcc \
    COMPILER_VERSION=$gcc_version \
    CC=/opt/view/bin/gcc \
    CXX=/opt/view/bin/g++ \
    FC=/opt/view/bin/gfortran \
    CPP=/opt/view/bin/cpp


# build compiler and set defaults
RUN spack external find hwloc ncurses \
 && spack spec --reuse "${gcc_spec}" \
 && spack -v install --deprecated --reuse "${gcc_spec}" \
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


