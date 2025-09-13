#!/usr/bin/env bash
set -euo pipefail
git submodule update --init --recursive
git -C externals/Xray-core fetch --depth 1 origin || true
git -C externals/Xray-core checkout origin/main || true
echo "Submodule ready."
