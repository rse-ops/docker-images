ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version

# Install with spack
ARG hip_version
ENV hip_version=$hip_version

# We need this patch https://github.com/trws/spack/blob/2a54f77d7ebdfbbf131d43abd941ba7736a09737/var/spack/repos/builtin/packages/llvm/package.py#L342-L343
RUN spack install --until libice --deprecated hip@${hip_version} rocprim@${hip_version}
