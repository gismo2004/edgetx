#!/bin/bash

# Usage: ./make-pr-patch.sh <PR-NUMBER> [REPO]
# Example: ./make-pr-patch.sh 6085 EdgeTX/edgetx

PR_NUM="$1"
REPO="${2:-EdgeTX/edgetx}"

if [ -z "$PR_NUM" ]; then
  echo "ERROR: PR number missing."
  echo "Usage: ./make-pr-patch.sh <PR#> [org/repo]"
  exit 1
fi

echo "Downloading PR #$PR_NUM from $REPO as patch..."

PATCH_FILE="pr-${PR_NUM}.patch"
PATCH_URL="https://github.com/${REPO}/pull/${PR_NUM}.patch"

# Download patch
curl -L "$PATCH_URL" -o "$PATCH_FILE"

if [ $? -ne 0 ]; then
  echo "ERROR: Failed to download patch from $PATCH_URL"
  exit 2
fi

echo "Patch saved as: $PATCH_FILE"
echo "Apply it with: git am $PATCH_FILE"
