#!/bin/bash

# Define the array of business names without the 'com.' prefix
BUSINESS_NAMES=("binmile.com" "bincore.com")

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Function to replace com.blabber with the business name
replace_com_blabber() {
    sed -i "s/\bcom\.amazon\b/${1}/g" "$2"
}

# Loop through each business name and perform the replacement
for BUSINESS_NAME in "${BUSINESS_NAMES[@]}"; do
    echo "Replacing com.blabber with ${BUSINESS_NAME} in all files..."
  
    # Find and replace "com.blabber" with the current business name in all files
    find . -type f -exec bash -c 'replace_com_blabber "$1" "$0"' {} "$BUSINESS_NAME" \;

    echo "Replacement with ${BUSINESS_NAME} complete."
done

# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'com.blabber' with business names: ${BUSINESS_NAMES[*]}"

# Push the changes to the remote repository
git push origin main

echo "Changes committed and pushed to the repository."

