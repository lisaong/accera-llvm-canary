FROM ubuntu:focal

ARG TARGETPLATFORM
ARG BUILDPLATFORM

ARG LLVM_RELEASE
ARG LLVM_BUILD_TYPE=release

ADD scripts /tmp/scripts
WORKDIR /tmp/scripts
RUN sh /tmp/scripts/install.buildtools.sh $TARGETPLATFORM
RUN sh /tmp/scripts/install.cuda.sh $TARGETPLATFORM

ADD external/vcpkg /opt/vcpkg
ADD llvm /opt/llvm-port
WORKDIR /opt/vcpkg
RUN sh /tmp/scripts/install.vcpkg.sh /opt/llvm-port $TARGETPLATFORM

RUN rm -rf /tmp/scripts
