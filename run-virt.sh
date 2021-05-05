#!/bin/sh
set -o xtrace

timeout --foreground 10 \
  qemu-system-riscv64 -machine virt \
  -bios precompiled-U540.fd \
  -m 1024 -nographic -smp cpus=1,maxcpus=1 | tee boot.log \
  || true

ls -l U540.fd
timeout --foreground 10 \
  qemu-system-riscv64 -machine virt \
  -bios Build/FreedomU540HiFiveUnleashed/DEBUG_GCC5/FV/U540.fd \
  -m 1024 -nographic -smp cpus=1,maxcpus=1 | tee boot.log \
  || true

grep -q 'Shell>' boot.log
