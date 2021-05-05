#!/bin/sh
timeout --foreground 10 \
  qemu-system-riscv64 \
  -cpu sifive-u54 -machine sifive_u \
  -bios U540.fd \
  -m 1024 -nographic -smp cpus=5,maxcpus=5 | tee boot.log \
  || true
ls -l boot.log
cat boot.log
grep -q 'Shell>' boot.log \
  && echo 'Booted to UEFI Shell' \
  || echo 'Failed to boot to UEFI Shell'; false
