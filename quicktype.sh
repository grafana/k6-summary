#!/bin/bash

# A script to automate the generation of Go structs from JSON schemas using Quicktype.
# It takes a package name and a version as arguments.
#
# Usage: ./quicktype.sh <package_name> <version>
#
# Example: ./quicktype.sh main v1.0.0

# Check if the correct number of arguments were provided.
if [ "$#" -ne 2 ]; then
  echo "Error: Two arguments (package name and version) are required."
  echo "Usage: $0 <package_name> <version>"
  exit 1
fi

# Assign arguments to variables for clarity.
PACKAGE_NAME=$1
VERSION=$2

# Check if the 'quicktype' command is available.
if ! command -v quicktype &> /dev/null; then
  echo "Error: The 'quicktype' tool is not found."
  echo "Please install it with: npm install -g quicktype"
  exit 1
fi

echo "Starting schema generation for package '$PACKAGE_NAME' and version '$VERSION'..."

# Define an array of schema names. You can add more schemas to this list.
SCHEMAS=("schema.json")

# Loop through each schema file and run the quicktype command.
for SCHEMA_FILE in "${SCHEMAS[@]}"; do
  # Construct the full path to the schema file.
  SCHEMA_PATH="schemas/$PACKAGE_NAME/$VERSION/$SCHEMA_FILE"
  # Capitalize the package name to use it as schema type name.
  TOP_LEVEL_TYPE=$(echo "$PACKAGE_NAME" | awk '{print toupper(substr($0,1,1)) tolower(substr($0,2))}')

  # Check if the schema file exists at the specified path.
  if [ -f "$SCHEMA_PATH" ]; then
    echo "--> Generating Go code for: $SCHEMA_PATH"
    # Create the directory, if it doesn't exist yet
    mkdir -p "generated/quicktype/$PACKAGE_NAME/$VERSION"
    # The command to generate the Go code using quicktype.
    quicktype --src-lang schema --lang go --package "$PACKAGE_NAME" --top-level "$TOP_LEVEL_TYPE" -o "generated/quicktype/$PACKAGE_NAME/$VERSION/${SCHEMA_FILE%.json}.go" "$SCHEMA_PATH"

    # Check the exit status of the quicktype command.
    if [ $? -eq 0 ]; then
      echo "--> Success: Generated ${SCHEMA_PATH%.json}-quicktype.go"
    else
      echo "--> Error: Failed to generate Go code for $SCHEMA_PATH"
    fi
  else
    echo "--> Warning: Schema file not found at: $SCHEMA_PATH"
  fi
done

echo "Schema generation complete."

