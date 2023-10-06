#!/bin/bash

# the directory passed as an argument to the script
dir=$1

# check if directory exists
if [ ! -d "$dir" ]; then
    echo "Directory does not exist"
    exit 1
fi

# find all files and directories under the directory
find "$dir" -depth | while read file; do
    # only process if the filename contains the ID format
    if [[ $(basename "$file") =~ ([[:space:]][a-fA-F0-9]{32}) ]]; then
        # get the directory part of the file path
        dirpart=$(dirname "$file")
        # get the file/directory name
        filepart=$(basename "$file")
        # remove the 32-character hexadecimal ID
        newfilepart=${filepart//${BASH_REMATCH[1]}/}
        # rename the file/directory
        mv "$file" "$dirpart/$newfilepart"
    fi
done

