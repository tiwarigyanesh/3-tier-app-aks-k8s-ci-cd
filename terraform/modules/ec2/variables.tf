variable "vpc_id" {
  description = "The VPC ID where the instances will be created"
  type        = string
}

variable "subnet_ids" {
  description = "A map of subnet IDs for the instances"
  type        = any
}

variable "ec2_instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ami                         = string
    instance_type               = string
    key_name                    = string
    availability_zone           = string
    associate_public_ip_address = bool
    tags                        = map(string)
  }))
}

variable "security_group_id" {
  description = "The security group ID to attach to the instances"
  type        = any
}
