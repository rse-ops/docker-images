#!/bin/bash

set -e

echo "Original path is $filename"
relative=$(echo ${filename/\/github\/workspace\//})
echo "Relative path is $relative"
echo "::set-output name=relative_path::${relative}"
