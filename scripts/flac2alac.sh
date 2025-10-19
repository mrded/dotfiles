#!/bin/bash

[ -z "$1" ] && echo "Usage: $0 <input.flac>" && exit 1

INPUT="$1"
OUTPUT="${1%.*}.m4a"
TEMP="${1%.*}_temp.m4a"

# Extract metadata
ARTIST=$(ffprobe -v error -show_entries format_tags=artist -of default=nw=1:nk=1 "$INPUT")
ALBUM=$(ffprobe -v error -show_entries format_tags=album -of default=nw=1:nk=1 "$INPUT")
TITLE=$(ffprobe -v error -show_entries format_tags=title -of default=nw=1:nk=1 "$INPUT")
ALBUM_ARTIST=$(ffprobe -v error -show_entries format_tags=album_artist -of default=nw=1:nk=1 "$INPUT")
GENRE=$(ffprobe -v error -show_entries format_tags=genre -of default=nw=1:nk=1 "$INPUT")
DATE=$(ffprobe -v error -show_entries format_tags=date -of default=nw=1:nk=1 "$INPUT")
TRACK=$(ffprobe -v error -show_entries format_tags=track -of default=nw=1:nk=1 "$INPUT")
COMPOSER=$(ffprobe -v error -show_entries format_tags=composer -of default=nw=1:nk=1 "$INPUT")

# Convert to ALAC
ffmpeg -y -nostdin -hide_banner -loglevel error -stats \
  -i "$INPUT" -c:a alac -c:v copy -map 0 -map_metadata -1 "$TEMP" || exit 1

# Add iTunes metadata
AtomicParsley "$TEMP" --overWrite \
  ${TITLE:+--title "$TITLE"} \
  ${ARTIST:+--artist "$ARTIST"} \
  ${ALBUM:+--album "$ALBUM"} \
  ${ALBUM_ARTIST:+--albumArtist "$ALBUM_ARTIST"} \
  ${GENRE:+--genre "$GENRE"} \
  ${DATE:+--year "$DATE"} \
  ${TRACK:+--tracknum "$TRACK"} \
  ${COMPOSER:+--composer "$COMPOSER"} \
  > /dev/null 2>&1 && mv "$TEMP" "$OUTPUT" && echo "Done: $OUTPUT" || exit 1
