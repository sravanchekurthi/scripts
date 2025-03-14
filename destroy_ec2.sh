#!/bin/bash

# Variables
INSTANCE_ID="i-0abc1234d5678efgh"  # Replace with your instance ID

# Terminate EC2 Instance
aws ec2 terminate-instances --instance-ids $INSTANCE_ID

echo "EC2 Instance '$INSTANCE_ID' terminated."
