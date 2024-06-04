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

# Find and replace "com.amazon" with "com.amazon" in all files
find . -type f -exec sed -i 's/com\.binmile/com\.amazon/g' {} +

echo "Replacement complete."

# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'com.amazon' with 'com.amazon'"

echo "Changes committed to the repository."

