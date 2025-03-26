#!/bin/bash

# Set variables
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
DB_NAME="your_database_name"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S)  # Format the backup file with a timestamp

# Create the backup file name
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}_${DATE}.sql"

# Perform the backup using mysqldump
mysqldump -u ${DB_USER} -p${DB_PASSWORD} ${DB_NAME} > ${BACKUP_FILE}

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup of ${DB_NAME} was successful and saved to ${BACKUP_FILE}"
else
  echo "Backup of ${DB_NAME} failed!"
fi