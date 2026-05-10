# Create an S3 bucket in AWS using Terraform. Once the S3 bucket is created, we can later use it as a remote backend for our other projects.

# Once this backend is created, use the following block in your main projects to store state remotely:

# terraform {
#  backend "s3" {
#    bucket         = "your-tfstate-bucket-name"
#    key            = "env-name/terraform.tfstate"
#    region         = "ap-south-1"
#    encrypt        = true
#    use_lockfile   = true
#  }
# }

# Replace your-tfstate-bucket-name and your-lock-table-name with actual output values from this project.

# Please check Hands_On_Practical_&_Steps.docx this word file for steps.
