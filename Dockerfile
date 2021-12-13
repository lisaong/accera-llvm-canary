FROM ubuntu:focal

ADD scripts /tmp/scripts

WORKDIR /tmp/scripts
RUN sh /tmp/scripts/install.buildtools.sh

ADD external/vcpkg /opt/vcpkg
ADD llvm /opt/llvm
WORKDIR /opt/vcpkg
RUN sh /tmp/scripts/install.vcpkg.sh

RUN rm -rf /tmp/scripts
