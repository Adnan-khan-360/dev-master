#!/bin/bash

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Find and replace "bincore.com.com.com" with "com.binmile" in all files
find . -type f -exec sed -i 's/com\.realme/com\bincore.com.com.com/g' {} +

echo "Replacement complete."

# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'bincore.com.com.com' with 'com.binmile'"

echo "Changes committed to the repository."

git push origin main
