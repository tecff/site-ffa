FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    binutils \
    flex \
    bison \
    python3 \
    python3-distutils \
    python3-dev \
    perl \
    libssl-dev \
    libncurses-dev \
    libz-dev \
    unzip \
    zip \
    gawk \
    gettext \
    wget \
    curl \
    git \
    rsync \
    subversion \
    file \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 builder
USER builder
WORKDIR /build
