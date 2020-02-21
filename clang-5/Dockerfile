FROM axom/compilers:ubuntu-base

LABEL maintainer="David Beckingsale <david@llnl.gov>"

ENV llvmver=5.0.1
ENV llvmtar=clang+llvm-5.0.1-x86_64-linux-gnu-ubuntu-16.04
ENV tarext=.tar.xz

RUN \
    wget -q --no-check-certificate http://releases.llvm.org/${llvmver}/${llvmtar}${tarext} \
    && tar xf ${llvmtar}${tarext} \
    && sudo cp -fR ${llvmtar}/* /usr \
    && rm -rf ${llvmtar} \
    && rm ${llvmtar}${tarext}

USER axom
WORKDIR /home/axom
