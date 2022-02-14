@setlocal
@echo off

REM To update the submodule: git submodule update --remote --merge
git submodule init
git submodule update

REM call external\vcpkg\bootstrap-vcpkg.bat

REM e.g. set LLVM_RELEASE=llvmorg-14.0.0-rc1
set LLVM_RELEASE=%1
set VCPKG_KEEP_ENV_VARS=LLVM_RELEASE,LLVM_BUILD_TYPE

external\vcpkg\vcpkg install accera-llvm:x64-windows --overlay-ports=llvm