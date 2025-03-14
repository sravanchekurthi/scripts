# Terraform Configuration for S3 Bucket with Versioning Enabled:

# Provider Configuration
provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

# S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"  # Replace with a unique bucket name

  # Enable versioning
  versioning {
    enabled = true
  }

  # Optionally, configure bucket lifecycle (e.g., to delete old versions)
  lifecycle {
    prevent_destroy = true  # Prevents accidental deletion of the bucket
  }

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

# Output the bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
