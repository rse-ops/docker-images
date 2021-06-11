FROM axom/compilers:ubuntu-base

LABEL maintainer="David Beckingsale <david@llnl.gov>"

RUN sudo apt-get -qq update \
  && sudo apt-get -qq install -y apt-transport-https ca-certificates \
  && sudo wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB \
  && sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2023.PUB \
  && echo "deb https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list \
  && sudo apt-get -qqq update \
  && sudo apt-get install -y intel-oneapi-compiler-fortran intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic

RUN sudo apt-get -qq install -y lsb-release && sudo apt-get clean all

COPY entrypoint.sh /usr/local/bin/

USER axom
WORKDIR /home/axom

ENTRYPOINT ["entrypoint.sh"]
