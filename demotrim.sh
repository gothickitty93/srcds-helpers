#!/bin/bash

# mv /path/to/incorrect/folder/for/demos/*.dem /path/to/demos
# the above is a workaround in case demos decide they don't want to live in the demos folder sometimes
demo_folder_path="/path/to/demos"
max_initial_size_bytes=$((1024 * 1024 * 1024))  # 1024MB in bytes
target_size_bytes=$((768 * 1024 * 1024))  # 768MB in bytes

# Calculate the current folder size in bytes
current_size_bytes=$(du -sb "$demo_folder_path" | awk '{print $1}')

if [ "$current_size_bytes" -gt "$max_initial_size_bytes" ]; then
    while [ "$current_size_bytes" -gt "$target_size_bytes" ]; do
        # Find and delete the oldest demo file
        rm -- "$(ls -rt /path/to/demos/*.dem | head -n 1)"
        echo "Deleted the oldest demo file."

        # Recalculate the current folder size in bytes
        current_size_bytes=$(du -sb "$demo_folder_path" | awk '{print $1}')
    done
    echo "Folder size is now within the acceptable range (768MB or smaller)."
else
    echo "Folder size is already within the acceptable range (768MB or smaller)."
fi
