#!/bin/bash

# A script to automate the generation of Go structs from JSON schemas.
# It takes a package name and a version as arguments.
#
# Usage: ./go-jsonschema.sh <package_name> <version>
#
# Example: ./go-jsonschema.sh main v1.0.0

# Check if the correct number of arguments were provided.
if [ "$#" -ne 2 ]; then
  echo "Error: Two arguments (package name and version) are required."
  echo "Usage: $0 <package_name> <version>"
  exit 1
fi

# Assign arguments to variables for clarity.
PACKAGE_NAME=$1
VERSION=$2

# Check if the 'go-jsonschema' command is available.
if ! command -v go-jsonschema &> /dev/null; then
  echo "Error: The 'go-jsonschema' tool is not found."
  echo "Please install it with: go install github.com/atombender/go-jsonschema@latest"
  exit 1
fi

echo "Starting schema generation for package '$PACKAGE_NAME' and version '$VERSION'..."

# Define an array of schema names. You can add more schemas to this list.
# For this example, we assume these files exist in the same directory.
SCHEMAS=("schema.json")

# Loop through each schema file and run the go-jsonschema command.
for SCHEMA_FILE in "${SCHEMAS[@]}"; do
  # Construct the full path to the schema file.
  SCHEMA_PATH="schemas/$PACKAGE_NAME/$VERSION/$SCHEMA_FILE"

  # Check if the schema file exists before attempting to process it.
  if [ -f "$SCHEMA_PATH" ]; then
    echo "--> Generating Go code for: $SCHEMA_PATH"
    # The command to generate the Go code.
    # It pipes the output to a file named after the schema, with a .go extension.
    go-jsonschema -p "$PACKAGE_NAME" --resolve-extension json --schema-root-type "https://schemas.k6.io/metric/1.0.0/schema.json=Metric" --schema-root-type "https://schemas.k6.io/summary/1.0.0/schema.json=Summary" "$SCHEMA_PATH" > "${SCHEMA_PATH%.json}-gojsonschema.go"

    # Check the exit status of the go-jsonschema command.
    if [ $? -eq 0 ]; then
      echo "--> Success: Generated ${SCHEMA_PATH%.json}-gojsonschema.go"
    else
      echo "--> Error: Failed to generate Go code for $SCHEMA_PATH"
    fi
  else
    echo "--> Warning: Schema file not found: $SCHEMA_PATH"
    fi
done

echo "Schema generation complete."

# go-jsonschema -p summary -t \
  #  --schema-root-type "https://schemas.k6.io/metric/1.0.0/schema.json=Metric" \
  #  --schema-root-type "https://schemas.k6.io/summary/1.0.0/schema.json=Summary" \
  #  --schema-root-type "https://schemas.k6.io/semver/2.0.0/schema.json=SemVer" \
  #  --schema-output   "https://schemas.k6.io/metric/1.0.0/schema.json=metric_gen.go" \
  #  --schema-output   "https://schemas.k6.io/summary/1.0.0/schema.json=summary_gen.go" \
  #  --schema-output   "https://schemas.k6.io/semver/2.0.0/schema.json=semver_gen.go" \
  #  schemas/metric/1.0.0/schema.json schemas/summary/1.0.0/schema.json schemas/semver/2.0.0/schema.json

# go-jsonschema -p summary --schema-root-type "https://schemas.k6.io/metric/1.0.0/schema.json=Metric" --schema-root-type "https://schemas.k6.io/summary/1.0.0/schema.json=Summary" --schema-root-type "https://schemas.k6.io/semver/2.0.0/schema.json=SemVer" --schema-output   "https://schemas.k6.io/metric/1.0.0/schema.json=metric_gen.go" --schema-output   "https://schemas.k6.io/summary/1.0.0/schema.json=summary_gen.go" --schema-output   "https://schemas.k6.io/summary/1.0.0/schema.json=summary_gen.go" --schema-output   "https://schemas.k6.io/semver/2.0.0/schema.json=semver_gen.go" schemas/metric/1.0.0/schema.json schemas/summary/1.0.0/schema.json schemas/semver/2.0.0/schema.json
