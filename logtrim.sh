#!/bin/bash

log_folder_path="/path/to/logs"
max_initial_size_bytes=$((32 * 1024 * 1024))  # 32MB in bytes
target_size_bytes=$((8 * 1024 * 1024))  # 8MB in bytes

# Calculate the current folder size in bytes
current_size_bytes=$(du -sb "$log_folder_path" | awk '{print $1}')

if [ "$current_size_bytes" -gt "$max_initial_size_bytes" ]; then
    while [ "$current_size_bytes" -gt "$target_size_bytes" ]; do
        # Find and delete the oldest log file
        rm -- "$(ls -rt /path/to/logs/*.log | head -n 1)"
        echo "Deleted the oldest log file."

        # Recalculate the current folder size in bytes
        current_size_bytes=$(du -sb "$log_folder_path" | awk '{print $1}')
    done
    echo "Folder size is now within the acceptable range (8MB or smaller)."
else
    echo "Folder size is already within the acceptable range (8MB or smaller)."
fi
