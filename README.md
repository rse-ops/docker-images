# Radiuss Docker

![img/rse-radiuss-docker.png](img/rse-radiuss-docker.png)

[![License](https://img.shields.io/badge/License-MIT%203--Clause-blue.svg)](https://github.com/rse-radiuss/radius-docker/blob/main/LICENSE)

This project is part of [RADIUSS](https://computing.llnl.gov/projects/radiuss), which
has a focus on helping open source scientific projects use best practices for
automation and development.

This repository contains Dockerfiles for CI builds for use by the various
[RADIUSS](https://software.llnl.gov/radiuss/) projects, and anyone else that
might be interested. The image builds are automated and self-updating, and process
described more below in detail.

## Base Images

A core base image is considered the lowest level - an operating system with
only a handful of additional dependencies that won't vary with the operating system.
For comparison with the [previous axom repository](https://github.com/LLNL/axom-docker), 
these are currently only considered the "base" image (e.g., the "base" subfolders present 
in nested folders there). A strategy to build other
bases on top of that (e.g., with gcc, clang, etc.) is still in the works.
To maintain these images, we will use the [uptodate](https://github.com/vsoch/uptodate)
GitHub action.

## Matrix Images

A matrix image uses a base image, as described above, to add a matrix of different
installs. This is a different approach than a core base image because we likely
want to use a common template with different build arguments, as opposed to
very different `Dockerfile` (as would be expected with base). We will
also be using a GitHub action for this approach (not developed yet, and the
`Dockerfile` and other logic is not added yet to the repository here.

**under development**

License
-------

Copyright (c) 2017-2021, Lawrence Livermore National Security, LLC. 
Produced at the Lawrence Livermore National Laboratory.

RADIUSS Docker is licensed under the MIT license [LICENSE](./LICENSE).

Copyrights and patents in the RADIUSS Docker project are retained by
contributors. No copyright assignment is required to contribute to RADIUSS
Docker.

This work was produced under the auspices of the U.S. Department of
Energy by Lawrence Livermore National Laboratory under Contract
DE-AC52-07NA27344.
