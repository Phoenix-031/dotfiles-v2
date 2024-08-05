#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Directory containing the images
DIR=$1

# Find all jpg, jpeg, and png files in the directory and count them
count=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | wc -l)
echo "Total number of images: $count"

# Initialize counter
counter=1

# Rename the files
for file in "$DIR"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
  # Check if the file exists to avoid errors with non-matching patterns
  if [ -e "$file" ]; then
    ext="${file##*.}"
    mv "$file" "$DIR/wall-$counter.$ext"
    echo "Renamed $file to wall-$counter.$ext"
    counter=$((counter + 1))
  fi
done

echo "Renaming complete. Total files renamed: $((counter - 1))"
