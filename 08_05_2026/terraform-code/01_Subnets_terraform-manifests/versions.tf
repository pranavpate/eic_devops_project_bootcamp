terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket       = "tfstate-dev-ap-south-1-5n72px"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    profile      = "pranav-terraform-profile"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "pranav-terraform-profile"
}
