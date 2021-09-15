ARG ubuntu_version
FROM ghcr.io/rse-radiuss/ubuntu:$ubuntu_version

# Install intel-oneapi with spack
ARG intel_version
ENV intel_version=$intel_version

RUN spack install intel-oneapi-compilers@${intel_version}
RUN spack view symlink /opt/view intel-oneapi-compilers@${intel_version}
