#!/bin/bash

base_folder="gurobi_out"
folders=("log" "model" "solution")

for folder in "${folders[@]}"; do
    path="$base_folder/$folder"
    if [ -d "$path" ]; then
        echo "Clearing $path..."
        rm -rf "$path"/*
    else
        echo "Directory does not exist: $path"
    fi
done

echo "Done."
