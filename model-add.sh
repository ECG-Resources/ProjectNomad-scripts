#!/bin/bash

# Prompt the user for the Ollama model tag
read -r -p "Enter OLLAMA model name: " modelname

# Validate that input is not empty
if [[ -z "${modelname// }" ]]; then
  echo "Error: Model name cannot be blank." >&2
  exit 1
fi

# Post the payload with properly expanded double quotes
curl -X POST -H "Content-Type: application/json" -d "{\"model\":\"$modelname\"}" http://localhost:8080/api/ollama/models
