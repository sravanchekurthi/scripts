#!/bin/bash

# Define variables
USERNAME="newuser"
PASSWORD="newpassword"
DIRECTORY="/home/$USERNAME/data"

# Add the new user
useradd -m -s /bin/bash $USERNAME

# Set the password for the new user
echo "$USERNAME:$PASSWORD" | chpasswd
# Create a directory for the user and set permissions
mkdir -p $DIRECTORY
chown $USERNAME:$USERNAME $DIRECTORY
chmod 700 $DIRECTORY
echo "User $USERNAME added and directory $DIRECTORY created with permissions set."
