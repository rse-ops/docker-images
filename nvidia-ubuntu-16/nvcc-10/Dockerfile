FROM nvidia/cuda:10.1-devel-ubuntu16.04

LABEL maintainer="David Beckingsale <david@llnl.gov>"

ADD generic-setup.sh /root/generic-setup.sh

RUN /root/generic-setup.sh

USER axom
WORKDIR /home/axom
