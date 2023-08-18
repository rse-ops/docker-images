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

# Bootstrap clingo
spack bootstrap now

# Find packages already installed on system, e.g. autoconf
# IMPORTANT: ensure that all binaries installed include their development files
#            failure to do this will get them detected, and kill builds with
#            spack
spack external find # NOTE no all
# Find some packages out of the default check set that work
spack external find python perl binutils git tar xz bzip2 hwloc ncurses
# configure spack
# build for the generic target
spack config add 'packages:all:target:[x86_64]'
# reuse as much as possible, make externals useful
spack config add 'concretizer:reuse:true'
# Generate spack environment for packages
spack env create --dir /opt/env --with-view /opt/view
# Activate created environment
spack env activate --without-view /opt/env
# Add binary mirror
spack mirror add develop https://binaries.spack.io/releases/develop
# Move install tree outside of spack directory so spack repo can be removed after
spack config add "config:install_tree:root:'/opt'"
# Concretize spec
spack spec --reuse $0
# Add spec to environment
spack add $0
spack buildcache keys --install --trust
spack install --fail-fast

# delete spack to save space
rm -rf /opt/spack

# ensure clangs and others that don't inject rpaths make working executables
cat >/etc/ld.so.conf.d/spack_view.conf <<EOF
/opt/view/lib
/opt/view/lib64
EOF
ldconfig

popd
