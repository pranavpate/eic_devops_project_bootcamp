variable "environment_name" {
  description = "Deployment environment "
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to deploy backend"
  type        = string
  default     = "ap-south-1"
}