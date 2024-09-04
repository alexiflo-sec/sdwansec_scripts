#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
  echo "Error: No input file provided."
  echo "Usage: $0 input_file.txt"
  exit 1
fi

# Check if wget is installed
if ! command -v wget &> /dev/null; then
  echo "Error: wget is not installed."
  exit 1
fi

# Read the file line by line
while IFS= read -r url; do
  # Skip empty lines or lines starting with #
  if [[ -z "$url" || "$url" == "#"* ]]; then
    continue
  fi
  
  # Download the file using wget
  echo "Downloading: $url"
  curl -A "$url" http://bing.com > /dev/null
  sleep 5s
done < "$1"
#echo "IPS Script finished at $(date)" >> $HOME/Downloads/runs.txt
