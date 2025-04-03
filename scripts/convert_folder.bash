#!/bin/bash

# Input directory containing .ply files
INPUT_DIR="$1"
OUTPUT_DIR="$INPUT_DIR/cc_converts"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all .ply files in the input directory
for file in "$INPUT_DIR"/*.ply; do
    # Get the filename without path
    filename=$(basename "$file")
    output_file="$OUTPUT_DIR/${filename%.ply}_cc.ply"
    
    # Run 3dgsconverter
    3dgsconverter -i "$file" -o "$output_file" -f cc --rgb
    
    echo "Converted: $file -> $output_file"
done

