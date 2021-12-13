#!/bin/sh
set -e -x

wget -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin \
    && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub \
    && add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /" \
    && apt-get install -y --no-install-recommends cuda-minimal-build-11-3 cuda-nvrtc-dev-11-3

export CMAKE_LIBRARY_PATH=/usr/local/cuda-11.3/targets/x86_64-linux/lib/stubs

printf 'export PATH=/usr/local/cuda-11.3/bin:$PATH\n' >> ${HOME}/.bashrc \
    && printf "`head /etc/ld.so.conf.d/cuda-11-3.conf`/stubs\\n" >> /etc/ld.so.conf.d/cuda-11-3.conf