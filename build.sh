#!/bin/sh
if [ -z "$1" ]; then
    echo "Usage: $0 tag"
    echo "E.g. $0 llvmorg-14.0.0-rc1"
    exit 1
fi

set -x -e

# To update the submodule: git submodule update --remote --merge
git submodule init
git submodule update

./external/vcpkg/bootstrap-vcpkg.sh

export LLVM_RELEASE=$1
export VCPKG_KEEP_ENV_VARS=LLVM_RELEASE,LLVM_BUILD_TYPE

external/vcpkg/vcpkg install accera-llvm --overlay-ports=llvm