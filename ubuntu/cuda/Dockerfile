ARG ubuntu_version
FROM ghcr.io/rse-radiuss/ubuntu:$ubuntu_version

# Install llvm with spack
ARG cuda_version
ENV cuda_version=$cuda_version

RUN spack install cuda@${cuda_version}
RUN spack view -d no symlink -i /opt/view cuda@${cuda_version}
