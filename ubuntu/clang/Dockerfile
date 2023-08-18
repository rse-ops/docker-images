ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version
ENV llvm_spec="llvm@${llvm_version}+llvm_dylib+link_llvm_dylib~split_dwarf~lldb~polly build_type=MinSizeRel" \
    # these are safe here only because spack ignores them
    COMPILER_NAME=clang \
    COMPILER_VERSION=$llvm_version \
    CC=/opt/view/bin/clang \
    CXX=/opt/view/bin/clang++ \
    CPP=/opt/view/bin/clang-cpp

# build compiler and set defaults then remove spack to keep image size small
RUN ./scripts/build-with-spack.sh "${llvm_spec}"
RUN update-alternatives --install /usr/bin/cc cc ${CC} 50 \
 && update-alternatives --install /usr/bin/c++ c++ ${CXX} 50 \
 && update-alternatives --install /usr/bin/cpp cpp ${CPP} 50 \
 && update-alternatives --install /usr/bin/c89 c89 ${CC} 50 \
 && update-alternatives --install /usr/bin/c99 c99 ${CC} 50
