#!/bin/bash

# Define the names you want to replace "amazon.com" with
new_names=("amazon.com" "blabber.com" "binmile.com")

# Loop through each new name
for name in "${new_names[@]}"; do
    # Use find to search for files matching the pattern and replace the text
    find . -type f -name "data*.txt" -exec sed -i "s/amazon.com/$name/g" {} +
done
