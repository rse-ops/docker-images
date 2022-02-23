FROM ubuntu:18.04@sha256:c2aa13782650aa7ade424b12008128b60034c795f25456e8eb552d0a0f447cad

LABEL maintainer="Josh Essman <essman1@llnl.gov>, @vsoch"

ARG uptodate_github_commit_spack__spack__develop=84854741407e416d3d5abd787013c97a832c0027
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
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
