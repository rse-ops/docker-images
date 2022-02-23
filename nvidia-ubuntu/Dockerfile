ARG ubuntu_version
ARG cuda_version
FROM nvidia/cuda:${cuda_version}-devel-ubuntu${ubuntu_version}
LABEL maintainer="David Beckingsale <david@llnl.gov>,vsoch"

ENV cuda_version=$cuda_version
ENV CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-${cuda_version}
ENV spack_commit=develop

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ./scripts /opt/scripts
COPY ./ubuntu/scripts/* /opt/scripts
RUN ./scripts/apt-install-defaults-plus-args
ENV CMAKE=3.20.4
RUN ./scripts/install-cmake-binary

# Install spack
RUN ./scripts/set-up-spack
ENV PATH=/opt/spack/bin:$PATH
# Tell spack to use this one without arguments
ENV SPACK_ENV=/opt/env

# Add appropriate paths pointing to the view
ENV PATH=/opt/view/bin:$PATH
ENV MANPATH=/opt/view/share/man:$MANPATH
ENV PKG_CONFIG_PATH=/opt/view/lib/pkgconfig:/opt/view/lib64/pkgconfig:/opt/view/share/pkgconfig:$PKG_CONFIG_PATH
ENV CMAKE_PREFIX_PATH=/opt/view
ENV ACLOCAL_PATH=/opt/view/share/aclocal
