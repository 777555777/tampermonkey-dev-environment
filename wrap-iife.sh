#!/bin/bash

DIST_DIR="./dist"

# Loop through all JS files in the dist directory
for file in "$DIST_DIR"/*.js; do
  if [ -f "$file" ]; then
    # Temporary file for output
    temp_file="${file}.temp"
    
    # Wrap the content in an IIFE
    echo ";(function() {" > "$temp_file"
    cat "$file" >> "$temp_file"
    echo "})();" >> "$temp_file"
    
    # Replace the original file
    mv "$temp_file" "$file"
    
    echo "IIFE-Wrapper wurde zu $(basename "$file") hinzugefügt."
  fi
done