ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install llvm with spack
ARG cuda_version
ENV cuda_version=$cuda_version

RUN spack add cuda@${cuda_version} && \
    spack mirror add develop https://binaries.spack.io/releases/develop && \
    spack buildcache keys --install --trust && \
    spack install
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view cuda@${cuda_version} && \
  spack compiler find
