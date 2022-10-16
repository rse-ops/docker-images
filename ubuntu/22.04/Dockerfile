FROM ubuntu:22.04@sha256:35fb073f9e56eb84041b0745cb714eff0f7b225ea9e024f703cab56aaa5c7720

LABEL maintainer="@vsoch"

ARG uptodate_github_commit_spack__spack__develop=10491e98a876df986ce9ee78902c440fe4a8337d
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
RUN ./scripts/ubuntu/apt-install-defaults-plus-args.sh && \
    ./scripts/install-cmake-binary.sh && \
    ./scripts/set-up-spack.sh
# Tell spack to use this one without arguments
# NOTE: this has to be here, setting it earlier will kill spack
ENV SPACK_ENV=/opt/env
