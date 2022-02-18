ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version
ENV llvm_spec=llvm@${llvm_version}+llvm_dylib+link_llvm_dylib+split_dwarf~lldb

RUN spack install ${llvm_spec}
# build compiler
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view ${llvm_spec} && \
  spack compiler find

# set default for spack
RUN spack config add "packages:all:compiler:[clang@${llvm_version}]"

# set system defaults
RUN update-alternatives --install /usr/bin/cc cc /opt/view/bin/clang \
 && update-alternatives --install /usr/bin/c++ c++ /opt/view/bin/clang++ \
 && update-alternatives --install /usr/bin/cpp cpp /opt/view/bin/clang-cpp \
 && update-alternatives --install /usr/bin/c89 c89 /opt/view/bin/clang \
 && update-alternatives --install /usr/bin/c99 c99 /opt/view/bin/clang
