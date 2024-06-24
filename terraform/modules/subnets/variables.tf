variable "vpc_id" {
  description = "The VPC ID where subnets will be created"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    cidr_block              = string
    map_public_ip_on_launch = bool
    availability_zone       = string
  }))
}
