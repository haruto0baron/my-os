#!/bin/bash
set -e

sudo apt update

sudo apt install -y \
    build-essential \
    nasm \
    qemu-system-x86 \
    xorriso \
    grub-pc-bin \
    grub-common \
    gcc \
    g++ \
    make \
    curl
