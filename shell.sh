#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /home/adnan/dev-master"
    exit 1
fi

REPO_PATH=$1

# Check if the provided path is a valid directory
if [ ! -d "$REPO_PATH" ]; then
    echo "Error: Directory $REPO_PATH does not exist."
    exit 1
fi

# Navigate to the repository path
cd "$REPO_PATH" || exit

# Find and replace "com.binmile" with "com.binmile" in all files
find . -type f -exec sed -i 's/com\.blabber/com\.binmile/g' {} +

echo "Replacement complete."

# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'com.binmile' with 'com.binmile'"

echo "Changes committed to the repository."

