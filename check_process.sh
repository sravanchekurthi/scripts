#!/bin/bash
# Check if the process name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <process_name>"
  exit 1
fi
PROCESS_NAME=$1
# Check if the process is running using pgrep (pgrep returns 0 if the process is running)
if ! pgrep -x "$PROCESS_NAME" > /dev/null; then
  echo "$PROCESS_NAME is not running. Starting it..."
  # Replace <command_to_start_process> with the actual command to start your process
  <command_to_start_process> &
  echo "$PROCESS_NAME started."
else
  echo "$PROCESS_NAME is already running."
fi
