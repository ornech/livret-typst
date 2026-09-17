#!/usr/bin/env bash
# Compile le livret complet (toutes les fiches, sommaire automatique) en PDF.
# Usage : ./build.sh
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p out
typst compile --root . main.typ out/livret.pdf
echo "OK : out/livret.pdf"
