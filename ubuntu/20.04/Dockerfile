FROM ubuntu:20.04@sha256:33a5cc25d22c45900796a1aca487ad7a7cb09f09ea00b779e3b2026b4fc2faba

LABEL maintainer="Chris White <white238@llnl.gov>,@vsoch"

ARG uptodate_github_commit_spack__spack__develop=0e27f0561182e21c838606074ff3eeba0543d6ce
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
