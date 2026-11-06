#!/bin/bash

# Define the target destination directory
DESTINATION="/opt/project-nomad/storage/ollama"

# Prompt the user for the filename in the current directory
read -p "Enter the filename to copy: " filename

# Validate that the file exists and is a regular file
if [ -f "$filename" ]; then
    echo "File '$filename' found."
    
    # Check if the destination directory exists, optionally create it if needed
    if [ ! -d "$DESTINATION" ]; then
        echo "Destination directory '$DESTINATION' does not exist."
        read -p "Would you like to create it? (y/n): " create_dir
        if [[ "$create_dir" =~ ^[Yy]$ ]]; then
            sudo mkdir -p "$DESTINATION" || { echo "Error: Failed to create directory."; exit 1; }
        else
            echo "Aborting copy."
            exit 1
        fi
    fi
    
    # Perform the copy operation (using sudo in case permissions are restricted)
    echo "Copying '$filename' to '$DESTINATION'..."
    if sudo cp "$filename" "$DESTINATION/"; then
        echo "Success: '$filename' was successfully copied to $DESTINATION."
    else
        echo "Error: Failed to copy the file. (Check permissions)" >&2
        exit 1
    fi
else
    echo "Error: File '$filename' does not exist in the current directory." >&2
    exit 1
fi