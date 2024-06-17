terraform {
  backend "s3" {
    bucket         = "ironhack-project-bucket5"
    key            = "states/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "lock-table"
  }
}

provider "aws" {
  region = "eu-north-1"
}
