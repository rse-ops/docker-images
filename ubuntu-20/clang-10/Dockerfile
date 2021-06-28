FROM axom/compilers:ubuntu-20-base

LABEL maintainer="Josh Essman <essman1@llnl.gov>"

ENV llvmver=10.0.0
ENV llvmtar=clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-20.04
ENV tarext=.tar.xz

RUN \
    wget -q --no-check-certificate https://github.com/llvm/llvm-project/releases/download/llvmorg-${llvmver}/${llvmtar}${tarext} \
    && tar xf ${llvmtar}${tarext} \
    && sudo cp -fR ${llvmtar}/* /usr \
    && rm -rf ${llvmtar} \
    && rm ${llvmtar}${tarext}

USER axom
WORKDIR /home/axom
