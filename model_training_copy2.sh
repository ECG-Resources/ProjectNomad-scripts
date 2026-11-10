# Prompt for filename
echo -e "Enter filename to copy (e.g., my.file.txt):"
read -p "/opt/project/nomad/storage/ollama/$filename

# Validate the filename exists
if ls -f "$filename" != 0; then
    cp "$filename" /opt/project/nomad/storage/ollama
    echo "$filename copied successfully!"
else
    echo "$filename does not exist."
fi
