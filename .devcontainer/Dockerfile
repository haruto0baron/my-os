FROM ubuntu:24.04

RUN apt update && apt install -y \
    build-essential \
    gcc-multilib \
    nasm \
    grub-pc-bin \
    xorriso \
    qemu-system-x86 \
    make

WORKDIR /workspace