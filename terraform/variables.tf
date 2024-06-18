variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "eu-noth-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr_block              = string
    map_public_ip_on_launch = bool
    availability_zone       = string
  }))
}

variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "Egress rules for the security group"
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "ec2_instances" {
  type = map(object({
    ami                         = string
    instance_type               = string
    key_name                    = string
    availability_zone           = string
    associate_public_ip_address = bool
    # security_group_id           = string
    tags = map(string)
  }))
}

variable "frontend_security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "backend_security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "database_security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_name" {
  type = string
}

variable "destination_cidr_block" {
  type = string
}

variable "gateway_name" {
  type = string
}
