ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version
ENV llvm_spec="llvm@${llvm_version}+llvm_dylib+link_llvm_dylib~split_dwarf~lldb~polly+compiler-rt build_type=MinSizeRel" \
    # these are safe here only because spack ignores them
    COMPILER_NAME=clang \
    COMPILER_VERSION=$llvm_version \
    CC=/opt/view/bin/clang \
    CXX=/opt/view/bin/clang++ \
    CPP=/opt/view/bin/clang-cpp

# build compiler and set defaults
RUN spack external find hwloc ncurses \
 && spack spec --reuse "${llvm_spec}" \
 && spack -v install --reuse "${llvm_spec}" \
 && spack compiler add \
 && spack config add "packages:all:compiler:[${COMPILER_NAME}@${COMPILER_VERSION}]" \
 && update-alternatives --install /usr/bin/cc cc ${CC} 50 \
 && update-alternatives --install /usr/bin/c++ c++ ${CXX} 50 \
 && update-alternatives --install /usr/bin/cpp cpp ${CPP} 50 \
 && update-alternatives --install /usr/bin/c89 c89 ${CC} 50 \
 && update-alternatives --install /usr/bin/c99 c99 ${CC} 50
ENV LD_LIBRARY_PATH=/opt/view/lib:${LD_LIBRARY_PATH}
