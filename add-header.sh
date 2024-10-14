#!/bin/bash

# Directory where the script folders are located
SRC_DIR="./src"
DIST_DIR="./dist"

# Loop through all subfolders in the src directory
for dir in "$SRC_DIR"/*/; do
  # Extract the folder name (script name)
  script_name=$(basename "$dir")

  # Set paths for the header and the script file
  HEADER_FILE="$SRC_DIR/$script_name/header.txt"
  SCRIPT_FILE="$DIST_DIR/$script_name.js"

  # Check if the header file and the generated script file exist
  if [ -f "$HEADER_FILE" ] && [ -f "$SCRIPT_FILE" ]; then
    # Combine the header and the script
    cat "$HEADER_FILE" "$SCRIPT_FILE" > temp.js && mv temp.js "$SCRIPT_FILE"
    echo "Tampermonkey-Header wurde zu $SCRIPT_FILE hinzugefügt."
  else
    echo "Header oder Skriptdatei für $script_name wurde nicht gefunden."
  fi
done
