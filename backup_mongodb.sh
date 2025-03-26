#!/bin/bash

# Set variables
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
DB_NAME="your_database_name"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S)  # Format the backup file with a timestamp

# MongoDB URI (if using a MongoDB URI, you can add it here)
MONGO_URI="mongodb://$DB_USER:$DB_PASSWORD@localhost:27017"

# Create the backup file name
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}_${DATE}"

# Perform the backup using mongodump
mongodump --uri="$MONGO_URI" --db=${DB_NAME} --out=${BACKUP_FILE}
# mongodump --uri="$MONGO_URI" --db=${DB_NAME} --archive=${BACKUP_FILE}.gz --gzip

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup of ${DB_NAME} was successful and saved to ${BACKUP_FILE}"
else
  echo "Backup of ${DB_NAME} failed!"
fi