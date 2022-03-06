ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install with spack
ARG hip_version
ENV hip_version=$hip_version

# Update package file to have patch
COPY ubuntu/hip/package.py /opt/spack/var/spack/repos/builtin/packages/llvm-amdgpu/package.py
COPY ubuntu/hip/no_cyclades.patch /opt/spack/var/spack/repos/builtin/packages/llvm-amdgpu/no_cyclades.patch

# We need this patch https://github.com/trws/spack/blob/2a54f77d7ebdfbbf131d43abd941ba7736a09737/var/spack/repos/builtin/packages/llvm/package.py#L342-L343
RUN spack install meson && \
    spack install --deprecated hip@${hip_version} rocprim@${hip_version}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view hip@${hip_version} && \
  spack view --dependencies no symlink --ignore-conflicts /opt/view llvm-amdgpu@${hip_version} && \
  spack view --dependencies no symlink --ignore-conflicts /opt/view rocprim@${hip_version} && \
  spack compiler find
