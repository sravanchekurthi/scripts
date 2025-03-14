import boto3

# Initialize a session using Amazon EC2
ec2 = boto3.resource('ec2', region_name='us-east-1')  # Change to your desired region

# Create an EC2 instance
def create_ec2_instance():
    try:
        print("Creating EC2 instance...")

        # Launch an EC2 instance
        instance = ec2.create_instances(
            ImageId='ami-0c55b159cbfafe1f0',  # Replace with a valid AMI ID for your region
            InstanceType='t2.micro',  # Change to your desired instance type
            MinCount=1,
            MaxCount=1,
            KeyName='your-key-pair',  # Replace with your EC2 key pair name
            SecurityGroupIds=['your-security-group-id'],  # Replace with your security group ID
            SubnetId='your-subnet-id',  # Optional: specify subnet if using a VPC
            TagSpecifications=[  # Optional: Add tags to the instance
                {
                    'ResourceType': 'instance',
                    'Tags': [
                        {
                            'Key': 'Name',
                            'Value': 'MyEC2Instance'
                        }
                    ]
                }
            ]
        )

        print(f"EC2 Instance created with ID: {instance[0].id}")
        return instance[0].id

    except Exception as e:
        print(f"Error creating EC2 instance: {e}")
        return None

if __name__ == '__main__':
    create_ec2_instance()
