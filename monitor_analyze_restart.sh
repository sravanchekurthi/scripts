#!/bin/bash

# Bash Script to Monitor, Analyze Logs, and Restart Web Server
# Set the web server service name (change as per your web server, e.g., apache2, nginx)
SERVICE_NAME="apache2"  # Or "nginx" for Nginx
LOG_FILE="/var/log/${SERVICE_NAME}/error.log"  # Default log file path (adjust based on your service)
STATUS_COMMAND="systemctl status $SERVICE_NAME"

# Check if the web server service is running
SERVICE_STATUS=$(systemctl is-active $SERVICE_NAME)

# If the service is not running, attempt to restart
if [ "$SERVICE_STATUS" != "active" ]; then
    echo "$(date) - $SERVICE_NAME service is not running. Checking logs..."
    
    # Check the most recent error from the log file
    LAST_ERROR=$(tail -n 10 $LOG_FILE | grep -i 'error')

    # If there's an error, show it
    if [ ! -z "$LAST_ERROR" ]; then
        echo "Last error in log file: $LAST_ERROR"
    else
        echo "No recent errors found in logs. Restarting the service anyway..."
    fi

    # Restart the web server service
    echo "$(date) - Attempting to restart the $SERVICE_NAME service..."
    systemctl restart $SERVICE_NAME

    # Check if the service restarted successfully
    NEW_STATUS=$(systemctl is-active $SERVICE_NAME)
    if [ "$NEW_STATUS" == "active" ]; then
        echo "$(date) - $SERVICE_NAME service restarted successfully."
    else
        echo "$(date) - Failed to restart $SERVICE_NAME service."
        exit 1
    fi
else
    echo "$(date) - $SERVICE_NAME service is already running."
fi

# Optional: You can add additional logging if needed
echo "$(date) - Script completed." >> /var/log/web_server_check.log
