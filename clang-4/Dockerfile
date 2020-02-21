FROM axom/compilers:ubuntu-base

LABEL maintainer="David Beckingsale <david@llnl.gov>"

ENV llvmver=4.0.0
ENV llvmtar=clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04
ENV tarext=.tar.xz

RUN \
    wget -q --no-check-certificate http://releases.llvm.org/${llvmver}/${llvmtar}${tarext} \
    && tar xf ${llvmtar}${tarext} \
    && sudo cp -fR ${llvmtar}/* /usr \
    && rm -rf ${llvmtar} \
    && rm ${llvmtar}${tarext}

USER axom
WORKDIR /home/axom
