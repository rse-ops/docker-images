#!/bin/bash
set -euo pipefail
set -x
packages=(
  # fetchers
  ca-certificates
  curl
  git
  wget
  # interactive tools
  valgrind
  vim-nox
  # build stuff
  build-essential
  dh-autoreconf
  gnupg2
  lcov
  meson
  ninja-build
  pkg-config
  python3
  python3-pip
  python3-dev
  sudo
  xsltproc
  # common build deps
  libbinutils
  binutils-dev
  hwloc-nox
  libhwloc-dev
  libssl-dev
  lbzip2
  libbz2-dev
  libzip-dev
  liblzma-dev
  bzip2
  unzip
)
apt-get -qq update
apt-get -qq install -fy tzdata
apt-get -qq install -y --no-install-recommends "${packages[@]}" "$@"
rm -rf /var/lib/apt/lists/*
apt-get clean
