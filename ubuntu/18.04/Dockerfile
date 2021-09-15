FROM ubuntu:18.04@sha256:9bc830af2bef73276515a29aa896eedfa7bdf4bdbc5c1063b4c457a4bbb8cd79

LABEL maintainer="Josh Essman <essman1@llnl.gov>, @vsoch"

ARG uptodate_github_commit_spack__spack__develop=0015f700b77247873d06ddd12c496ebb782d4713
ENV spack_commit=${uptodate_github_commit_spack__spack__develop}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends \
      wget \
      python3-dev \
      python3-pip \
      build-essential \
      sudo \
      git \
      vim \
      dh-autoreconf \
      ninja-build \
      libssl-dev \
      ca-certificates \
      valgrind \
      gnupg2

# Install spack
WORKDIR /opt
RUN git clone https://github.com/spack/spack && \
    cd spack && \
    git reset --hard ${spack_commit}
ENV PATH=/opt/spack/bin:$PATH

# Use the autamus build cache for maybe faster install?
RUN pip install botocore boto3 && \
    spack mirror add autamus s3://autamus-cache && \
    curl http://s3.amazonaws.com/autamus-cache/build_cache/_pgp/FFEB24B0A9D81F6D5597F9900B59588C86C41BE7.pub > key.pub && \
    spack gpg trust key.pub

# Find packages already installed on system, e.g. autoconf and install cmake
RUN spack external find && \
    spack install cmake@3.20.4

RUN spack view symlink /opt/view cmake@3.20.4
ENV PATH=/opt/view/bin:$PATH
