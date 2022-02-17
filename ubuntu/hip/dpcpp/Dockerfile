ARG hip_version
FROM ghcr.io/rse-ops/hip-ubuntu-22.04:$hip_version

# Install dpc++ with spack
ARG dpcpp_version
ENV dpcpp_version=$dpcpp_version
ENV spack_spec=dpcpp@${dpcpp_version} build_type=MinSizeRel +rocm+lld+openmp+shared

RUN spack install ${spack_spec}
RUN spack view --dependencies no symlink --ignore-conflicts /opt/view ${spack_spec} && \
  spack compiler find
