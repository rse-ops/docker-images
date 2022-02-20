ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG llvm_version
ENV llvm_version=$llvm_version

# Gold variant starting failing builds missing plugin-api.h
# https://github.com/rse-ops/docker-images/runs/5256215113?check_suite_focus=true
ENV llvm_install=llvm@${llvm_version} -gold

RUN spack install ${llvm_install}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view ${llvm_install} && \
  spack compiler find
