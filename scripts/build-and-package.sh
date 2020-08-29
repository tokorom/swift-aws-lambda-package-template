#!/bin/bash

set -eu

executable=Lambda
workspace="$(pwd)"

echo "-------------------------------------------------------------------------"
echo "preparing docker build image"
echo "-------------------------------------------------------------------------"
docker build . -t builder
echo "done"

echo "-------------------------------------------------------------------------"
echo "building \"$executable\" lambda"
echo "-------------------------------------------------------------------------"
docker run --rm -v "$workspace":/workspace -w /workspace builder bash -cl "swift build --product $executable -c release -Xswiftc -g"
echo "done"

echo "-------------------------------------------------------------------------"
echo "packaging \"$executable\" lambda"
echo "-------------------------------------------------------------------------"
docker run --rm -v "$workspace":/workspace -w /workspace builder bash -cl "./scripts/package.sh $executable"
echo "done"
