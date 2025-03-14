#!/bin/bash

# Define log file and search terms
LOG_FILE="/var/log/syslog"
SEARCH_TERMS=("error" "warning")
EMAIL="srsudden@gmail.com"

# Check log for specified terms and send email if found
for TERM in "${SEARCH_TERMS[@]}"; do
  if grep -i "$TERM" "$LOG_FILE" > /dev/null; then
    echo "[$(date)] Found '$TERM' in $LOG_FILE. Sending email alert." | mail -s "Log Alert: $TERM Found" $EMAIL
  fi
done
