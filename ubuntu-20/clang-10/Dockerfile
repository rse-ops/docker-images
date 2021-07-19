FROM axom/compilers:ubuntu-20-base_latest

LABEL maintainer="Josh Essman <essman1@llnl.gov>"

RUN \
    sudo apt-get -qq install -y --no-install-recommends \
        clang-10 clang-format-10 llvm-10 \
    && sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 100 \
    && sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 100 \
    && sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-10 100 \
    && sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-10 100 \
    && sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100 \
    && sudo update-alternatives --install /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-10 100
USER axom
WORKDIR /home/axom
