FROM ubuntu:20.04@sha256:669e010b58baf5beb2836b253c1fd5768333f0d1dbcb834f7c07a4dc93f474be

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch"

ARG uptodate_github_commit_spack__spack__develop=1cb82dc542b77fda90ac056d2ff9b1dfc06fdff8
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
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

