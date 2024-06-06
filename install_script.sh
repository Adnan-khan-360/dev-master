#!/bin/bash

# Define the array of business names
BUSINESS_NAMES=("com.bincore" "com.bincore")

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Function to escape periods in business names
escape_periods() {
  echo "$1" | sed 's/\./\\./g'
}

# Loop through each business name and perform the replacement
for BUSINESS_NAME in "${BUSINESS_NAMES[@]}"; do
  BUSINESS_NAME_ESCAPED=$(escape_periods "$BUSINESS_NAME")
  
  echo "Replacing com.bincore with ${BUSINESS_NAME} in all files..."
  
  # Find and replace "com.bincore" with the current business name in all files
  find . -type f -exec sed -i "s/com\.amazon/${BUSINESS_NAME_ESCAPED}/g" {} +

  echo "Replacement with ${BUSINESS_NAME} complete."
done

# Add changes to git
git add .

# Commit the changes
git commit -m "Replaced 'com.bincore' with business names: ${BUSINESS_NAMES[*]}"

# Push the changes to the remote repository
git push origin main

echo "Changes committed and pushed to the repository."

