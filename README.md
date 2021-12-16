# accera-llvm-canary
Infrastructure for Canary builds of LLVM for Accera

[![llvm ubuntu build](https://github.com/lisaong/accera-llvm-canary/actions/workflows/dockerbuild.yml/badge.svg)](https://github.com/lisaong/accera-llvm-canary/actions/workflows/dockerbuild.yml)

To build the release version of LLVM for a given ref (llvmorg-13.0.0):

```shell
docker build . --build-arg LLVM_RELEASE=llvmorg-13.0.0 --tag lisaong/accera-llvm-ubuntu:main-llvmorg-13.0.0
```

To build both release and debug versions of LLVM for a given ref (llvmorg-13.0.0)

```shell
docker build . --build-arg LLVM_RELEASE=llvmorg-13.0.0 --build-arg LLVM_BUILD_TYPE=debug --tag lisaong/accera-llvm-ubuntu-dbg:main-llvmorg-13.0.0
```