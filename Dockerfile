FROM ubuntu:focal

ARG LLVM_RELEASE
ARG LLVM_BUILD_TYPE=release

ADD scripts /tmp/scripts
WORKDIR /tmp/scripts
RUN sh /tmp/scripts/install.buildtools.sh
RUN sh /tmp/scripts/install.cuda.sh

ADD external/vcpkg /opt/vcpkg
ADD llvm /opt/llvm-port
WORKDIR /opt/vcpkg
RUN sh /tmp/scripts/install.vcpkg.sh /opt/llvm-port

RUN rm -rf /tmp/scripts
