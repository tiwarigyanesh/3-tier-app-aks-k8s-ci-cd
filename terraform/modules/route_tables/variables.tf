variable "route_table_name" {
  type = string
}

variable "gateway_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

# variable "routes" {
#   type = map(object({
#     destination_cidr_block = string
#     gateway_id             = string
#   }))
# }

variable "subnet_ids" {
  type = any
}

variable "destination_cidr_block" {
  type = string
}

