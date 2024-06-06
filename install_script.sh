#!/bin/bash

# Define the array of business names without the 'com.' prefix
BUSINESS_NAMES=("binmile" "faisal" "adnan")

# Define the array of branch names for Git
BRANCH_NAMES=("branc34" "data" "dev")

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Pull the old code
git pull

# Loop through each business name and its corresponding branch name
for i in "${!BUSINESS_NAMES[@]}"; do
    BUSINESS_NAME="${BUSINESS_NAMES[$i]}"
    BRANCH_NAME="${BRANCH_NAMES[$i]}"

    # Create a new branch with the specified branch name
    git checkout -b "${BRANCH_NAME}"

    echo "Replacing com.binmile with com.${BUSINESS_NAME} in all files..."
    
    # Find and replace "com.binmile" with the current business name in all files
    find . -type f -exec sed -i "s/com\.blabber/com\.${BUSINESS_NAME}/g" {} +
    
    echo "Replacement with com.${BUSINESS_NAME} complete."

    # Add all changes to the staging area
    git add .

    # Commit the changes with a dynamic message
    git commit -m "Replaced 'com.binmile' with com.${BUSINESS_NAME}"

    # Push the changes to the remote repository under the specified branch name
    git push origin "${BRANCH_NAME}"

    # Switch back to the main branch for the next iteration
    git checkout main
done

echo "Changes committed and pushed to the repository."
