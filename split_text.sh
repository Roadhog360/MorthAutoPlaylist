#!/bin/bash

# Usage: ./split_text.sh <output_folder> <input_file>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <output_folder> <input_file>"
    exit 1
fi

OUT_DIR="$1"
IN_FILE="$2"

# 1. Path & Existence Validation
if [ ! -f "$IN_FILE" ]; then
    echo "Error: Input file '$IN_FILE' not found."
    exit 1
fi

IN_DIR_PATH=$(dirname "$(realpath "$IN_FILE")")
OUT_DIR_PATH=$(realpath -m "$OUT_DIR")

if [ "$IN_DIR_PATH" == "$OUT_DIR_PATH" ]; then
    echo "Error: Input file and output directory cannot be the same."
    exit 1
fi

# 2. First Line Requirement
FIRST_LINE=$(head -n 1 "$IN_FILE")
if [[ ! "$FIRST_LINE" =~ ^# ]]; then
    echo "Error: Input file must begin with a commented line."
    exit 1
fi

mkdir -p "$OUT_DIR"

# State Tracking
# mode 0: Comment Discovery (Next comment triggers a NEW file)
# mode 1: Write Mode (Collecting body content; next comment triggers mode 0)
mode=0
current_file=""

while IFS= read -r line || [ -n "$line" ]; do
    if [[ "$line" =~ ^# ]]; then
        # If we were in body mode and hit a comment, it's time for a new file
        if [ "$mode" -eq 1 ]; then
            mode=0
        fi

        # If discovery mode: the very first comment in the block sets the filename
        if [ "$mode" -eq 0 ]; then
            # Extract text after #, trim leading/trailing space, replace internal spaces with _, remove invalid chars
            clean_name=$(echo "$line" | sed 's/^#//; s/^[[:space:]]*//; s/^[Tt]itle:[[:space:]]*//; s/[[:space:]]*$//; s/[[:space:]]\+/_/g; s/[^a-zA-Z0-9._]//g')
            current_file="$OUT_DIR_PATH/${clean_name}.txt"

            # Start the new file and write the triggering line
            printf "%s\n" "$line" > "$current_file"

            # Switch to "Collecting Headers" state (don't create another new file for consecutive comments)
            mode=2
        elif [ "$mode" -eq 2 ]; then
            # Still in header block; add line to current file
            printf "%s\n" "$line" >> "$current_file"
        fi
    else
        # Hit an uncommented line: Switch to Write Mode
        mode=1
        printf "%s\n" "$line" >> "$current_file"
    fi
done < "$IN_FILE"

echo "Success: Files split into $OUT_DIR"