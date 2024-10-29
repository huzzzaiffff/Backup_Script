#!/bin/bash

# Check if a directory path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Directory to back up
TARGET_DIR="$1"

# Generate a timestamp for the backup folder
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="${TARGET_DIR}/backup_${TIMESTAMP}"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Copy files from the target directory to the backup folder
cp -r "${TARGET_DIR}"/* "$BACKUP_DIR"
echo "Backup created: $BACKUP_DIR"

# Rotation Logic: Keep only the last 3 backups
# Find all backup directories, sorted by date, and delete older ones if more than 3 exist
BACKUPS=($(ls -d ${TARGET_DIR}/backup_* 2>/dev/null | sort))
NUM_BACKUPS=${#BACKUPS[@]}

if [ $NUM_BACKUPS -gt 3 ]; then
    DELETE_COUNT=$((NUM_BACKUPS - 3))
    for ((i=0; i<DELETE_COUNT; i++)); do
        rm -rf "${BACKUPS[$i]}"
        echo "Deleted old backup: ${BACKUPS[$i]}"
    done
fi

~
~
~
~
~
~
~
~
~
~
~
~
