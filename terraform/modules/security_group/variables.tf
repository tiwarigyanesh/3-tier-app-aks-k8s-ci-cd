variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
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

variable "subnet_cidr_blocks" {
  description = "CIDR blocks of the subnets"
  type        = map(string)
}

