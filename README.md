# accera-llvm-canary
Infrastructure for Canary builds of LLVM for Accera

[![llvm ubuntu build](https://github.com/lisaong/accera-llvm-canary/actions/workflows/dockerbuild.yml/badge.svg)](https://github.com/lisaong/accera-llvm-canary/actions/workflows/dockerbuild.yml)

## Docker build

To build the release version of LLVM for a given ref (llvmorg-14.0.0-rc4):

```shell
git submodule init
git submodule update

# to build multi-arch

docker buildx build . \
  --build-arg LLVM_RELEASE=llvmorg-14.0.0-rc4 --tag lisaong/accera-llvm-ubuntu:main-llvmorg-14.0.0-rc4 \
  --platform linux/arm64,linux/amd64 \
  --load

# or, to build for just the host platform
docker build . \
  --build-arg LLVM_RELEASE=llvmorg-14.0.0-rc4 --tag lisaong/accera-llvm-ubuntu:main-llvmorg-14.0.0-rc4
```

To build both release and debug versions of LLVM for a given ref (llvmorg-13.0.1):

```shell
# to build multi-arch
docker buildx build . \
  --build-arg LLVM_BUILD_TYPE=debug \
  --build-arg LLVM_RELEASE=llvmorg-13.0.1 --tag lisaong/accera-llvm-ubuntu:main-llvmorg-13.0.1 \
  --platform linux/arm64,linux/amd64 \
  --load

# or, to build for just the host platform
docker build . \
  --build-arg LLVM_BUILD_TYPE=debug \
  --build-arg LLVM_RELEASE=llvmorg-13.0.1 --tag lisaong/accera-llvm-ubuntu:main-llvmorg-13.0.1
```

Building debug-only LLVM is not supported by vcpkg.

## Local dev build

To build locally without docker (only Linux is supported currently):

```shell
sh build.sh llvmorg-13.0.1
```

To incrementally build locally after running `build.sh` at least once, run:

```shell
sh build.dev.sh
```
