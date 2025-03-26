#!/bin/bash

# Set variables
#DB_HOST="your-rds-endpoint.amazonaws.com"   # The RDS PostgreSQL endpoint --> Needed when DB is AWS RDS PostgreSQL
#DB_PORT="5432"                              # Default PostgreSQL port --> Needed when Db is AWS RDS PostgreSQL
DB_USER="your_db_user"                      # Your PostgreSQL user
DB_PASSWORD="your_db_password"              # Your PostgreSQL password
DB_NAME="your_database_name"                # The name of the database to back up
BACKUP_DIR="/path/to/backup/directory"      # Directory where backups will be stored
DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S)       # Current timestamp to append to backup file name

# Export the password so pg_dump can use it
export PGPASSWORD=${DB_PASSWORD}

# Create the backup file name
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}_${DATE}.sql"

# Perform the backup using pg_dump
pg_dump -U ${DB_USER} -d ${DB_NAME} -F c -f ${BACKUP_FILE}
# pg_dump -U ${DB_USER} -d ${DB_NAME} | gzip > ${BACKUP_FILE}.gz --> for further compression.
#pg_dump -h ${DB_HOST} -p ${DB_PORT} -U ${DB_USER} -d ${DB_NAME} -F c -f ${BACKUP_FILE} --> Command when using AWS RDS PostgreSQL

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup of ${DB_NAME} was successful and saved to ${BACKUP_FILE}"
else
  echo "Backup of ${DB_NAME} failed!"
fi

# Unset the password
unset PGPASSWORD

#Steps to execute backup script
    # chmod +x /path/to/backup_postgresql.sh --> Give executable permissions after creating the script
    # crontab -e --> Open crontab
    # 0 0 * * * /path/to/backup_postgresql.sh --> Set the script with full path and time to run.
    # crontab -l --> To verify weather script is set to run at specific time.
    # 0 0 * * * /path/to/backup_postgresql.sh >> /path/to/logs/backup.log 2>&1 --> This will generate a log file in the forwarding path with file name if we want logs incase of failures.