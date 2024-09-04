#!/bin/bash

# Check if a file name was provided as an argument
if [ $# -eq 0 ]; then
    echo "Please provide the name of the text file containing the URLs."
    exit 1
fi

# Check if the text file exists
if [ ! -f "$1" ]; then
    echo "File '$1' not found."
    exit 1
fi

# Read the file line by line and download the files using wget
while IFS= read -r url; do
    echo "Downloading $url"
    wget --tries=2 --timeout=10 --delete-after -q "$url"
    sleep 3s
done < "$1"
#echo "URL-F script finished at $(date)" >> $HOME/Downloads/runs.txt
