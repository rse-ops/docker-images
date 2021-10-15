ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version

RUN spack install llvm@${llvm_version}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view llvm@${llvm_version} && \
  spack compiler find
