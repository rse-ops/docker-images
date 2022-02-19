ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version
ENV llvm_spec=llvm@${llvm_version}+llvm_dylib+link_llvm_dylib+split_dwarf~lldb build_type=Release
ENV CC=/opt/view/bin/clang
ENV CXX=/opt/view/bin/clang++
ENV CPP=/opt/view/bin/clang-cpp

RUN spack install ${llvm_spec}
# build compiler
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view ${llvm_spec} && \
  spack compiler find

# set default for spack
RUN spack config add "packages:all:compiler:[clang@${llvm_version}]"

# set system defaults
RUN update-alternatives --install /usr/bin/cc cc ${CC} 50 \
 && update-alternatives --install /usr/bin/c++ c++ ${CXX} 50 \
 && update-alternatives --install /usr/bin/cpp cpp ${CPP} 50 \
 && update-alternatives --install /usr/bin/c89 c89 ${CC} 50 \
 && update-alternatives --install /usr/bin/c99 c99 ${CC} 50
