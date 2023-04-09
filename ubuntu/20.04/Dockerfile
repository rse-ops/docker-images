FROM ubuntu:20.04@sha256:24a0df437301598d1a4b62ddf59fa0ed2969150d70d748c84225e6501e9c36b9

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch"

ARG uptodate_github_commit_spack__spack__develop=6de3786c36053f413595986e6a91b94e23b3e6b1
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
