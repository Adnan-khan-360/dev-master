#!/bin/bash

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Find and replace "com.bincore" with "com.binmile" in all files
find . -type f -exec sed -i 's/com\.realme/com\.amazon/g' {} +

echo "Replacement complete."

# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'com.bincore' with 'com.binmile'"

echo "Changes committed to the repository."

git push origin main
