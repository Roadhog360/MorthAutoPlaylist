#!/bin/bash

# Usage: ./combine_text.sh [-c] <input_folder> <output_file>

COMPACT=false
if [ "$1" == "-c" ]; then
    COMPACT=true
    shift
fi

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [-c] <input_folder> <output_file>"
    exit 2
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

    if [ "$COMPACT" = true ]; then
        # COMPACT MODE:
        # 1. Remove lines starting strictly with #
        # 2. Remove lines that are entirely empty
        # 3. Ensure a trailing newline to prevent line-merging
        sed -e '/^#/d' -e '/^$/d' "$f" | sed '$a\' >> "$OUT_FILE"
    else
        # DEFAULT MODE: Header validation
        # Logic: If we see a strict comment (^#) AFTER we have seen content ([^#]), it's invalid.
        is_valid=$(awk 'BEGIN {content=0; err=0} /^#/ {if(content) err=1} /^[^#]/ {content=1} END {print err}' "$f")

        if [ "$is_valid" -eq 1 ]; then
            echo "Error: File '$(basename "$f")' contains comments after the header block. Merge aborted."
            rm -f "$OUT_FILE"
            exit 1
        fi

        # Append file content. sed '$a\' ensures the next file starts on a new line
        # without adding a blank line between them.
        sed '$a\' "$f" >> "$OUT_FILE"
    fi
done

echo "Done. File saved to $OUT_FILE"