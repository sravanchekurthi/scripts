#!/bin/bash/

# Define directories and backup destination
SOURCE_DIR="/home/sravan/Desktop/Sravan"
BACKUP_DIR="/home/sravan/Desktop/Backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Create the backup
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
