#!/bin/bash

# Usage: ./combine_text.sh <input_folder> <output_file>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_folder> <output_file>"
    exit 1
fi

IN_DIR="$1"
OUT_FILE="$2"

if [ ! -d "$IN_DIR" ]; then
    echo "Error: Input directory '$IN_DIR' not found."
    exit 1
fi

IN_DIR_PATH=$(realpath "$IN_DIR")
OUT_FILE_DIR=$(dirname "$(realpath -m "$OUT_FILE")")

if [ "$IN_DIR_PATH" == "$OUT_FILE_DIR" ]; then
    echo "Error: Output file cannot be placed inside the input directory."
    exit 1
fi

# Clear or create the output file
> "$OUT_FILE"

# Process all text files in order
for f in "$IN_DIR_PATH"/*.txt; do
    [ -e "$f" ] || continue

    # Validation: Ensure comments ONLY appear at the top.
    # Logic: If we see a comment (#) AFTER we have seen content ([^#]), it's invalid.
    is_valid=$(awk 'BEGIN {content=0; err=0} /^#/ {if(content) err=1} /^[^#]/ {content=1} END {print err}' "$f")

    if [ "$is_valid" -eq 1 ]; then
        echo "Error: File '$(basename "$f")' contains comments after the header block. Merge aborted."
        rm -f "$OUT_FILE"
        exit 1
    fi

    cat "$f" >> "$OUT_FILE"
done

echo "Success: Merged into $OUT_FILE"