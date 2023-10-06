#!/bin/zsh

for f in *.MP4; do echo "file '$f'" >> list.txt; done

# Use ffmpeg to concatenate the files
echo "Concatenating video files into output.MP4..."

ffmpeg -f concat -safe 0 -i list.txt -c copy output.MP4

# Log the end of the concatenation process
echo "Finished concatenating video files. Output saved as output.MP4"

# Remove the list file
rm list.txt
