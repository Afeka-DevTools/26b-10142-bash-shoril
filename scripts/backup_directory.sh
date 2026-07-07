#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

TARGET_DIR=$1
BACKUP_FILE="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

tar -czf "$BACKUP_FILE" "$TARGET_DIR"
echo "Backup created successfully: $BACKUP_FILE"