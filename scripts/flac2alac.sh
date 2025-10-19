#!/bin/bash
ffmpeg -y -i "$1" -c:a alac -vn -map 0:a -map_metadata 0 -movflags use_metadata_tags "${1%.*}.m4a"
