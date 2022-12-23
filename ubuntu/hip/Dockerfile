ARG hip_version
ARG ubuntu_version
FROM ghcr.io/rse-ops/hip-base-ubuntu-$ubuntu_version:llvm-amdgpu-${hip_version}

# Install with spack
ARG hip_version
ENV hip_version=$hip_version

# We need this patch https://github.com/trws/spack/blob/2a54f77d7ebdfbbf131d43abd941ba7736a09737/var/spack/repos/builtin/packages/llvm/package.py#L342-L343
RUN spack mirror add develop https://binaries.spack.io/releases/develop && \
    spack buildcache keys --install --trust && \
    spack add hip@${hip_version} && \
    spack add rocprim@${hip_version} && \
    spack install
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view hip@${hip_version} && \
  spack view --dependencies no symlink --ignore-conflicts /opt/view llvm-amdgpu@${hip_version} && \
  spack view --dependencies no symlink --ignore-conflicts /opt/view rocprim@${hip_version} && \
  spack compiler find
