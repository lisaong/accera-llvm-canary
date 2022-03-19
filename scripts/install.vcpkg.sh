#!/bin/sh
set -e -x

VCPKG_ROOT=`pwd`
PORT_SRC=$1

apt-get -qq update \
apt-get install -y --no-install-recommends \
    curl \
    pkg-config \
    tar \
    unzip \
    zip

${VCPKG_ROOT}/bootstrap-vcpkg.sh
${VCPKG_ROOT}/vcpkg install catch2 tomlplusplus --overlay-ports=${PORT_SRC}

export VCPKG_KEEP_ENV_VARS=LLVM_RELEASE,LLVM_BUILD_TYPE
${VCPKG_ROOT}/vcpkg install accera-llvm --overlay-ports=${PORT_SRC}