#!/bin/bash

# Define the array of business names without the 'com.' prefix
BUSINESS_NAMES=("amazon.com" "amazon.com" "itsbinmile.com")

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Loop through each business name and perform the replacement
for BUSINESS_NAME in "${BUSINESS_NAMES[@]}"; do
  echo "Replacing amazon.com with ${BUSINESS_NAME} in all files..."
  
  # Find and replace "amazon.com" with the current business name in all files
  #find . -type f -exec sed -i "s/com\.blabber/${BUSINESS_NAME}/g" {} +
  find . -type f -exec sed -i "s/bincore\.com/${BUSINESS_NAME}/g" {} +
done
  echo "Replacement with ${BUSINESS_NAME} complete."


# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'amazon.com' with business names: ${BUSINESS_NAMES[*]}"

# Push the changes to the remote repository
git push origin main

echo "Changes committed and pushed to the repository."

