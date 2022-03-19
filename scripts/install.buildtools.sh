#!/bin/sh
set -e -x

export CC=gcc-10
export CXX=g++-10
export CMAKE_C_COMPILER=gcc-10
export CMAKE_CXX_COMPILER=g++-10

TZ="America/Los_Angeles"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

apt-get -qq update \
&& apt-get install -y --no-install-recommends \
    software-properties-common \
    sudo \
    wget \
    git \
    g++-10 \
    make \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    nasm \
    libffi-dev \
    libssl-dev \
    ninja-build \
    zlib1g-dev \
    libbz2-dev \
    libsqlite3-dev \
    libreadline-dev \
    xz-utils \
    curl \
    libncurses5-dev \
    libncursesw5-dev \
    liblzma-dev \
    gnupg \
    ca-certificates \
    python3 \
    python3-pip \
    python3-dev \
    libvulkan-dev \
    libomp-dev

ln -sf /usr/bin/gcc-10 /usr/bin/gcc \
    && ln -sf /usr/bin/g++-10 /usr/bin/g++ \
    && ln -sf /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/*
