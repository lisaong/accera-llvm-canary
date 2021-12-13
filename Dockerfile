FROM ubuntu:focal

ADD scripts /tmp/scripts

WORKDIR /tmp/scripts
RUN sh /tmp/scripts/install.buildtools.sh
RUN sh /tmp/scripts/install.cuda.sh

ADD external/vcpkg /opt/vcpkg
ADD llvm /opt/llvm-port
WORKDIR /opt/vcpkg
RUN sh /tmp/scripts/install.vcpkg.sh

RUN rm -rf /tmp/scripts
