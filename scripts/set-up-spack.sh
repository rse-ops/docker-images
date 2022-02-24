#!/bin/bash
set -euo pipefail
set -x
pushd /opt

git clone https://github.com/spack/spack spack
pushd spack
git reset --hard ${spack_commit}
popd

# temporary path update for this script
export PATH=/opt/spack/bin:$PATH

# Install Clingo for Spack
python3 -m pip install --upgrade pip
python3 -m pip install clingo

# Find packages already installed on system, e.g. autoconf
# IMPORTANT: ensure that all binaries installed include their development files
#            failure to do this will get them detected, and kill builds with
#            spack
spack external find # NOTE no all
# Find some packages out of the default check set that work
spack external find python perl binutils git tar xz bzip2
# configure spack
# build for the generic target
spack config add 'packages:all:target:[x86_64]'
# reuse as much as possible, make externals useful
spack config add 'concretizer:reuse:true'
# avoid building an external cmake and python
spack config add 'packages:cmake:buildable:False'
spack config add 'packages:python:buildable:False'
# Generate spack environment for packages
spack env create --dir /opt/env --with-view /opt/view

# ensure clangs and others that don't inject rpaths make working executables
echo /opt/view/lib > /etc/ld.so.conf.d/spack_view.conf
echo /opt/view/lib64 > /etc/ld.so.conf.d/spack_view.conf
ldconfig

popd
