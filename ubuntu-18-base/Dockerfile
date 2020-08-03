FROM ubuntu:18.04

LABEL maintainer="Josh Essman <essman1@llnl.gov>"

ADD generic-setup.sh /root/generic-setup.sh

RUN /root/generic-setup.sh

USER axom
WORKDIR /home/axom
