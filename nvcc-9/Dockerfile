FROM nvidia/cuda:9.1-devel-ubuntu16.04

LABEL maintainer="David Beckingsale <david@llnl.gov>"

ENV CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-9.1

ADD generic-setup.sh /root/generic-setup.sh

RUN /root/generic-setup.sh

USER axom
WORKDIR /home/axom
