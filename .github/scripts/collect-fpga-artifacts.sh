#!/usr/bin/env bash

set -eu

output_dir="${GITHUB_WORKSPACE}/versal/work/implement/project"
staging="${RUNNER_TEMP}/fpga-${BUILD_ID}"
artifact_base="sc_obc_v1_versal_${SHORT_SHA}"

if [ "$GRADE" = "DEV" ] && [ "$VERSAL" = "VE2002" ]; then
  artifact_base="sc_obc_v1_versal_ve2002e_${SHORT_SHA}"
elif [ "$GRADE" = "DEV" ]; then
  artifact_base="sc_obc_v1_versal_ve2302e_${SHORT_SHA}"
fi

if [ ! -d "$output_dir" ]; then
  echo "::error::Output directory not found: $output_dir"
  exit 1
fi

mapfile -t xsa_files < <(
  find "$output_dir" -maxdepth 1 -type f -name '*.xsa' -print
)

mapfile -t pdi_files < <(
  find "$output_dir" -maxdepth 1 -type f -name '*.pdi' -print
)

if (( ${#xsa_files[@]} != 1 )); then
  echo "::error::Expected one XSA, found ${#xsa_files[@]}"
  printf '%s\n' "${xsa_files[@]}"
  exit 1
fi

if (( ${#pdi_files[@]} != 1 )); then
  echo "::error::Expected one PDI, found ${#pdi_files[@]}"
  printf '%s\n' "${pdi_files[@]}"
  exit 1
fi

mkdir -p "$staging"

cp "${xsa_files[0]}" "$staging/${artifact_base}.xsa"
cp "${pdi_files[0]}" "$staging/${artifact_base}.pdi"

ls -lh "$staging"
