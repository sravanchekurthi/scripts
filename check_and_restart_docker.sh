#!/bin/bash

# Specify the container name or container ID
CONTAINER_NAME="your_container_name"

# Check if the container is running
if ! docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" --format "{{.Names}}" | grep -q "$CONTAINER_NAME"; then
  echo "Container '$CONTAINER_NAME' is not running. Restarting it..."

  # Restart the container
  docker restart "$CONTAINER_NAME"

  if [ $? -eq 0 ]; then
    echo "Container '$CONTAINER_NAME' has been restarted successfully."
  else
    echo "Failed to restart the container '$CONTAINER_NAME'."
  fi
else
  echo "Container '$CONTAINER_NAME' is already running."
fi