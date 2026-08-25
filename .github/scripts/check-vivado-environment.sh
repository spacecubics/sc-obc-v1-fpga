#!/usr/bin/env bash

set -eu

echo "CPU:"
nproc

echo "Memory:"
free -h

echo "Storage:"
df -h /

test -f /opt/xilinx/2025.2/Vivado/settings64.sh

source /opt/xilinx/2025.2/Vivado/settings64.sh

which vivado
vivado -version
