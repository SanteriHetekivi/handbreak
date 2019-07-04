#!/bin/sh

# Setting helping variables.
presetPath="/data/preset.json"
tmpFile="/data/tmp.mkv"
filePath=$1
filename=$(basename -- "$filePath")
# Run encoding task from given file to tmp file.
HandBrakeCLI --preset-import-file "$presetPath" -i "$filePath" -o "$tmpFile" &&
# Replace tmp file with given file.
mv "$tmpFile" "$1" &&
echo "$filename done!"