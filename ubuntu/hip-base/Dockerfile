ARG ubuntu_version
FROM ghcr.io/rse-ops/ubuntu:$ubuntu_version
ARG llvm_amdgpu_version
ENV llvm_amdgpu_version=$llvm_amdgpu_version
RUN spack install --only dependencies --deprecated llvm-amdgpu@${llvm_amdgpu_version}
