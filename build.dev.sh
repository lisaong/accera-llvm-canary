#!/bin/sh
# Incremental build script
# Run this after build.sh has run at least once to download llvm and apply patches

set -x -e

HOME=`pwd`
cd external/vcpkg/buildtrees/accera-llvm/x64-linux-rel
cmake --build .
cmake --build . --target install
cd $HOME