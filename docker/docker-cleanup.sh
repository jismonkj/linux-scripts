#!/bin/bash

# Script Name: docker_cleanup.sh
# Description: Cleans up Docker containers, images, volumes, and networks with logging.

# Log file path
LOG_FILE="/var/log/docker_cleanup.log"

# Function to log messages with timestamps
log_message() {
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo "[$timestamp] $1" >> "$LOG_FILE"
}

# Function to execute a command and log its output and status
execute_command() {
  local command="$1"
  log_message "Executing: $command"
  output=$(eval "$command" 2>&1) # Capture both stdout and stderr
  return_code=$?
  log_message "Output:\n$output"
  log_message "Return Code: $return_code"
  if [ "$return_code" -ne 0 ]; then
    log_message "ERROR: Command '$command' failed."
  fi
  return "$return_code"
}


# Start logging
log_message "Docker Cleanup Script Started"

# Remove stopped containers
execute_command "docker container prune -f"
# Remove dangling images
execute_command "docker image prune -af"
# Remove unused volumes
execute_command "docker volume prune -f"
# Remove unused networks
execute_command "docker network prune -f"

# Optionally, remove all unused images (be very careful with this!)
# execute_command "docker image prune -a"  # Uncomment with caution!

# Optionally, remove all stopped containers (be very careful with this!)
# execute_command "docker container prune -a"  # Uncomment with caution!


log_message "Docker Cleanup Script Finished"
