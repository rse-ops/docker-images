FROM ubuntu:22.04@sha256:a02c32cf0c2a7e8743c74deef66637aa70e063c9bd40e9e1f8c0b3ea0750b0ba

LABEL maintainer="@vsoch"

ARG uptodate_github_commit_spack__spack__develop=84854741407e416d3d5abd787013c97a832c0027
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

WORKDIR /opt
COPY ../../scripts /opt/scripts
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
