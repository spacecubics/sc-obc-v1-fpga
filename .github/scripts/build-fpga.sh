#!/usr/bin/env bash

set -eu

source /opt/xilinx/2025.2/Vivado/settings64.sh

make_args=(GRADE="$GRADE")

if [ -n "$VERSAL" ]; then
  make_args+=(VERSAL="$VERSAL")
fi

make "${make_args[@]}"
