#!/bin/bash

# Define the array of business names
BUSINESS_NAMES=("com.amazon" "com.bincore")

# Print the current working directory
echo "Running script in directory: $(pwd)"

# Function to escape periods in business names
escape_periods() {
  echo "$1" | sed 's/\./\\./g'
}

# Loop through each business name and perform the replacement
for BUSINESS_NAME in "${BUSINESS_NAMES[@]}"; do
  BUSINESS_NAME_ESCAPED=$(escape_periods "$BUSINESS_NAME")
  
  echo "Replacing com.amazon with ${BUSINESS_NAME} in all files..."
  
  # Find and replace "com.amazon" with the current business name in all files
  find . -type f -exec sed -i "s/com\.blabber/${BUSINESS_NAME_ESCAPED}/g" {} +

  echo "Replacement with ${BUSINESS_NAME} complete."
done
