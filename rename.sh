#!/bin/bash

# Usage:
#   ./rename_files.sh                  → works on current directory
#   ./rename_files.sh /path/to/Music   → works on the Music directory
#   ./rename_files.sh ~/Music

TARGET_DIR="${1:-.}" # Use first argument, or current directory if none given

# Safety: dry-run first
DRY_RUN=false # Change to false when you're ready to rename

# Go into the target directory
cd "$TARGET_DIR" || {
  echo "Error: Cannot enter directory '$TARGET_DIR'"
  exit 1
}

echo "Working in: $(pwd)"
echo "----------------------------------------"

for file in *; do
  # Skip if not a regular file
  [[ -f "$file" ]] || continue

  # Extract extension (handles multiple dots)
  extension="${file##*.}"
  basename="${file%.*}"

  # Split by '-'
  IFS='-' read -ra parts <<<"$basename"

  if ((${#parts[@]} < 3)); then
    echo "Skipping (less than 3 parts): $file"
    continue
  fi

  new_name="${parts[0]} ${parts[1]} ${parts[2]}.$extension"

  if [[ -e "$new_name" ]]; then
    echo "SKIP (already exists): $file → $new_name"
    continue
  fi

  if [[ "$DRY_RUN" == true ]]; then
    echo "Would rename: $file  →  $new_name"
  else
    mv -- "$file" "$new_name"
    echo "Renamed: $file  →  $new_name"
  fi
done
