#!/bin/sh

ROOT_DIR="dynamatic/integration-test"

for sub in "$ROOT_DIR"/*; do
    if [ -d "$sub" ]; then
        OUT_DIR="$sub/out"
        if [ -d "$OUT_DIR" ]; then
            rm -rf "$OUT_DIR"
        fi
    fi
done