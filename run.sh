#!/bin/sh

# Run encode script for all .mkv files in data directory.
find /data/ -name '*.mkv' -exec /app/encode.sh {} \;