ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version
ENV llvm_spec=llvm@${llvm_version}+llvm_dylib+link_llvm_dylib+split_dwarf~lldb

RUN spack install ${llvm_spec}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view ${llvm_spec} && \
  spack compiler find
