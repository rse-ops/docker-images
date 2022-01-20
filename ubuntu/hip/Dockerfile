ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install with spack
ARG hip_version
ENV hip_version=$hip_version

RUN spack install --deprecated hip@${hip_version}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view hip@${hip_version} && \
  spack compiler find
