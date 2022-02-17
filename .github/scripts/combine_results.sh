#!/bin/bash

set -e

if [[ "${result}" == "" ]]; then
  result="[]"
fi

if [[ "${result_scheduled}" == "" ]]; then
  result_scheduled="[]"
fi

# Combine results into new output
result=$(python -c "import json; print(json.loads('${result}') + json.loads('${result_scheduled}'))")
if [[ "${result}" == "[]" ]]; then
  printf "The matrix is empty, will not trigger next workflow.\n"
  echo "::set-output name=empty_matrix::true"
else
  printf "The matrix is not empty, and we should continue on to the next workflow.\n"
  echo "::set-output name=empty_matrix::false"
fi
echo ${result}

# set for both workflows that use it
echo "::set-output name=dockerfilelist_matrix::${result}"
echo "::set-output name=dockerbuild_matrix::${result}"
