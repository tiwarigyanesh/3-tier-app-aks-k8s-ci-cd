variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "eu-noth-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnet names to their CIDRs"
  type        = map(string)
}