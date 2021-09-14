ARG ubuntu_version
FROM ghcr.io/rse-radiuss/ubuntu:$ubuntu_version

# Install gcc with spack
ARG gcc_version
ENV gcc_version=$gcc_version

RUN spack install gcc@${gcc_version}
