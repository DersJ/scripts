#!/bin/zsh

# Define the source and target directories
src_dir="/Volumes/Pocket2/DCIM/100MEDIA"
dest_dir_prefix=~/Movies/flyers

# Get the current date in MM-DD-YYYY format from the first video
first_video=$(ls $src_dir/*.MP4 | sort -n | head -1)
date=$(stat -f "%Sm" -t "%m-%d-%Y" "$first_video")

# # Create the destination directory with the date suffix
dest_dir=$dest_dir_prefix/$date
mkdir -p $dest_dir

# Log the start of the copy process
echo "Copying .MP4 files from $src_dir to $dest_dir..."

# Copy all .MP4 files to the destination directory
cp $src_dir/*.MP4 $dest_dir

# Log the end of the copy process
echo "Copied all .MP4 files to $dest_dir"

# Go to the destination directory
cd $dest_dir

# Create a list of files to be concatenated
echo "Preparing to concatenate video files..."

for f in *.MP4; do echo "file '$f'" >> list.txt; done

# Use ffmpeg to concatenate the files
echo "Concatenating video files into output.MP4..."

ffmpeg -f concat -safe 0 -i list.txt -c copy output.MP4

# Log the end of the concatenation process
echo "Finished concatenating video files. Output saved as output.MP4"

# Remove the list file
rm list.txt
