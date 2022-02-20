ARG cuda_version
FROM ghcr.io/rse-ops/cuda-ubuntu-22.04:$cuda_version

# Install dpc++ with spack
ARG dpcpp_version
ENV dpcpp_version=$dpcpp_version
ENV spack_spec="dpcpp@${dpcpp_version} build_type=MinSizeRel +cuda+lld+openmp+shared"

RUN spack install ${spack_spec}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view ${spack_spec} && \
  spack compiler find
