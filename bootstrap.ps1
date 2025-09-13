#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
git submodule update --init --recursive
git -C externals/Xray-core fetch --depth 1 origin | Out-Null
git -C externals/Xray-core checkout origin/main | Out-Null
Write-Host "Submodule ready."
