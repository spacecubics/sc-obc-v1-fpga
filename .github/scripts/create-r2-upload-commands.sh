#!/usr/bin/env bash

set -eu

for name in CLOUDFLARE_ACCOUNT_ID R2_BUCKET; do
  if [ -z "${!name}" ]; then
    echo "::error::Missing required environment value: $name"
    exit 1
  fi
done

artifact_dir="${RUNNER_TEMP}/fpga-artifacts"

object_prefix_for() {
  local filename="$1"

  case "$EVENT_NAME:$REF_TYPE" in
    workflow_dispatch:*)
      echo "snapshot/${REPOSITORY_NAME}/${SHA}"
      ;;
    push:tag)
      if [[ "$filename" == *_ve2002e_* ]]; then
        echo "${R2_RELEASE_VE2002_PREFIX%/}/${REF_NAME}/fpga"
      else
        echo "${R2_RELEASE_PREFIX%/}/${REF_NAME}/fpga"
      fi
      ;;
    *)
      echo "::error::Unsupported publish event: $EVENT_NAME ($REF_TYPE)" >&2
      return 1
      ;;
  esac
}

mapfile -t files < <(
  find "$artifact_dir" -maxdepth 1 -type f \
    \( -name '*.xsa' -o -name '*.pdi' \) -print | sort
)

if (( ${#files[@]} == 0 )); then
  echo "::error::No FPGA artifacts found in $artifact_dir"
  exit 1
fi

for file in "${files[@]}"; do
  size="$(stat --format='%s' "$file")"

  if (( size > 315000000 )); then
    echo "::error::$(basename "$file") exceeds Wrangler's 315 MB upload limit"
    exit 1
  fi
done

{
  echo "commands<<EOF"
  for file in "${files[@]}"; do
    filename="$(basename "$file")"
    object_prefix="$(object_prefix_for "$filename")"
    object_path="${R2_BUCKET}/${object_prefix}/${filename}"

    printf 'r2 object put %s --file %s --content-type application/octet-stream --remote\n' \
      "$object_path" \
      "$file"
  done
  echo "EOF"
} >> "$GITHUB_OUTPUT"

for file in "${files[@]}"; do
  filename="$(basename "$file")"
  object_prefix="$(object_prefix_for "$filename")"
  object_path="${R2_BUCKET}/${object_prefix}/${filename}"

  echo "Uploading $filename to r2://$object_path"
done
