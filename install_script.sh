#!/bin/bash

# Define the array of business names without the 'com.' prefix
BUSINESS_NAMES=("binmile" "faisal" "adnan")

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Pull the old code
git pull

# Loop through each business name
for BUSINESS_NAME in "${BUSINESS_NAMES[@]}"; do

    # Create a new branch dynamically named based on the business name
    BRANCH_NAME="test-${BUSINESS_NAME}"
    git checkout -b "${BRANCH_NAME}"

    echo "Replacing com.blabber with com.${BUSINESS_NAME} in all files..."
    
    # Find and replace "com.blabber" with the current business name in all files
    find . -type f -exec sed -i "s/com\.blabber/com\.${BUSINESS_NAME}/g" {} +
    
    echo "Replacement with com.${BUSINESS_NAME} complete."

    # Add all changes to the staging area
    git add .

    # Commit the changes with a dynamic message
    git commit -m "Replaced 'com.blabber' with com.${BUSINESS_NAME}"

    # Push the changes to the remote repository under the dynamically named branch
    git push origin "${BRANCH_NAME}"

    # Switch back to the original branch
    git checkout main
done

echo "Changes committed and pushed to the repository."
