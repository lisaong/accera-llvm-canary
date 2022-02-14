#!/bin/sh
set -x -e

# Usage:
#   sh build.sh tag
# Example:
#   sh build.sh llvmorg-14.0.0-rc1

# To update the submodule: git submodule update --remote --merge
git submodule init
git submodule update

./external/vcpkg/bootstrap-vcpkg.sh

export LLVM_RELEASE=$1
export VCPKG_KEEP_ENV_VARS=LLVM_RELEASE,LLVM_BUILD_TYPE

external/vcpkg/vcpkg install accera-llvm --overlay-ports=llvm