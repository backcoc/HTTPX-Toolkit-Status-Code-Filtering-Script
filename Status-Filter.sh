#!/bin/bash

# Create directories if they don't exist
mkdir -p live-200-site
mkdir -p live-all-except-404

# Loop through all .txt files in the current directory
for file in *.txt; do
    [ -e "$file" ] || continue  # Skip if no .txt files exist
    
    # Extract domains from file and filter for status 200 (only URLs, no status codes)
    httpx-toolkit -silent -mc 200 -l "$file" | awk '{print $1}' > "live-200-site/$file"
    echo "Processed $file for 200 status codes."

    # Extract domains from file and filter for all status codes except 404 (only URLs, no status codes)
    httpx-toolkit -silent -sc -l "$file" | grep -v ' 404$' | awk '{print $1}' > "live-all-except-404/2-5xx-$file"
    echo "Processed $file for all status codes except 404."
done

echo "All processing completed!"
