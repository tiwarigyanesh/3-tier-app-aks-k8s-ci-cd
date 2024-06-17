provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "ironhack-project-bucket5"

  tags = {
    Name        = "Terraform state bucket"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  depends_on = [aws_s3_bucket.terraform_state]
}
