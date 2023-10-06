#!/bin/bash

# Get the most recent .mov file from ~/Desktop
latest_mov_file=$(ls -t ~/Desktop/*.mov | head -n 1)

# Check if a .mov file was found
if [ -z "$latest_mov_file" ]; then
  echo "No .mov files found on the Desktop."
  exit 1
fi

# Get the file name without extension
filename_without_ext="${latest_mov_file%.*}"

# Convert the .mov file to .mp4 using ffmpeg
ffmpeg -i "$latest_mov_file" "${filename_without_ext}.mp4"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  # If successful, delete the original .mov file
  rm "$latest_mov_file"
  echo "Conversion successful. Deleted original .mov file."
else
  # If the conversion failed, print an error message
  echo "Conversion failed. The original .mov file was not deleted."
  exit 1
fi

