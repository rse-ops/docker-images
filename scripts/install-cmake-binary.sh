#!/bin/bash
set -euo pipefail
set -x
: ${CMAKE:=3.23.1}
curl -s -L https://github.com/Kitware/CMake/releases/download/v$CMAKE/cmake-$CMAKE-linux-x86_64.sh > cmake.sh
sh cmake.sh --prefix=/usr/local --skip-license
rm cmake.sh
