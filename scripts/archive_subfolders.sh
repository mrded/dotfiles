#!/bin/bash
# Usage: ./archive_subfolders.sh /path/to/folder

set -euo pipefail

TARGET_DIR="${1:-.}"

cd "$TARGET_DIR"

for d in */ ; do
    # remove trailing slash
    folder="${d%/}"
    archive="${folder}.tar.gz"
    checksum="${archive}.sha256"

    echo "Archiving $folder -> $archive"
    tar -czf "$archive" "$folder"

    echo "Generating checksum -> $checksum"
    sha256sum "$archive" > "$checksum"
done

echo "✅ Done!"
