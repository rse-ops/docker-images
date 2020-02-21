FROM rocm/rocm-terminal:2.3

LABEL maintainer="David Beckingsale <david@llnl.gov>"

ADD generic-setup.sh /root/generic-setup.sh

RUN sudo /root/generic-setup.sh

USER axom
WORKDIR /home/axom
