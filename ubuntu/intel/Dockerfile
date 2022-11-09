ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install intel-oneapi with spack
ARG intel_version
ENV intel_version=$intel_version

RUN spack add intel-oneapi-compilers@${intel_version} && spack install
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view intel-oneapi-compilers@${intel_version} && \
  spack compiler find
