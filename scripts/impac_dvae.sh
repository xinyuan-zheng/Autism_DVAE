#!/bin/bash

# Function to display usage instructions
usage() {
  echo "Usage: $0 [-o output_directory]"
  exit 1
}

# Parse command-line arguments
while getopts ":o:" opt; do
  case $opt in
    o)
      OUTPUT_DIR=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage
      ;;
  esac
done

# Check if output directory is provided
if [ -z "$OUTPUT_DIR" ]; then
  usage
fi

# Define variables
FILE_URL="https://github.com/ramp-kits/autism/archive/master.zip"
ZIP_FILE="master.zip"
GITHUB_REPO="https://github.com/ajbarryiii/Autism_VAE"

# Download the zip file
echo "Downloading zip file from $FILE_URL..."
wget $FILE_URL -O $ZIP_FILE

# Unzip the file
echo "Unzipping the file..."
unzip $ZIP_FILE

# Remove the zip file
echo "Removing the zip file..."
rm $ZIP_FILE

# Rename the unzipped directory
mv autism-master "$OUTPUT_DIR"

# Change to the specified output directory
cd "$OUTPUT_DIR"

# Clone the GitHub repository into a temporary directory
TEMP_DIR=$(mktemp -d)
echo "Cloning GitHub repository $GITHUB_REPO into a temporary directory..."
git clone $GITHUB_REPO "$TEMP_DIR"

# Move the contents of the cloned repository to the output directory
echo "Moving contents of the cloned repository to $OUTPUT_DIR..."
mv $TEMP_DIR/* $TEMP_DIR/.* . 2>/dev/null

# Remove the temporary directory
rm -rf "$TEMP_DIR"

echo "Done."