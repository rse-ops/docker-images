ARG ubuntu_version
ARG cuda_version
FROM nvidia/cuda:${cuda_version}-devel-ubuntu${ubuntu_version}
LABEL maintainer="David Beckingsale <david@llnl.gov>,vsoch"

ENV cuda_version=$cuda_version
ENV CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-${cuda_version}
ENV spack_commit=develop
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

# Add appropriate paths pointing to the view
ENV PATH=/opt/view/bin:/opt/spack/bin:$PATH \
    MANPATH=/opt/view/share/man:$MANPATH \
    PKG_CONFIG_PATH=/opt/view/lib/pkgconfig:/opt/view/lib64/pkgconfig:/opt/view/share/pkgconfig:$PKG_CONFIG_PATH \
    CMAKE_PREFIX_PATH=/opt/view \
    ACLOCAL_PATH=/opt/view/share/aclocal

WORKDIR /opt
COPY ./scripts /opt/scripts
# Install spack
RUN ./scripts/ubuntu/apt-install-defaults-plus-args.sh &&\
    ./scripts/install-cmake-binary.sh &&\
    ./scripts/set-up-spack.sh
# Tell spack to use this one without arguments
# NOTE: this has to be here, setting it earlier will kill spack
ENV SPACK_ENV=/opt/env

