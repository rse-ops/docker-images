ARG ubuntu_version
FROM ghcr.io/rse-radiuss/ubuntu:$ubuntu_version

# Install with spack
ARG hip_version
ENV hip_version=$hip_version

RUN spack install hip@${hip_version} && \
  spack compiler find && \
  spack view --dependencies no symlink --ignore-conflicts /opt/view hip@${hip_version}
