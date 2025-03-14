#!/bin/bash

# Variables
INSTANCE_TYPE="t2.micro"  # Change to your desired instance type
AMI_ID="ami-0abcdef1234567890"  # Replace with a valid AMI ID
KEY_NAME="your-key-pair"  # Replace with your key pair name
SECURITY_GROUP="your-security-group-id"  # Replace with your security group ID
SUBNET_ID="subnet-0bb1c79de3EXAMPLE"  # Replace with your subnet ID
INSTANCE_NAME="MyEC2Instance"

# Create EC2 Instance
aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP \
    --subnet-id $SUBNET_ID \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"

echo "EC2 Instance '$INSTANCE_NAME' created."
