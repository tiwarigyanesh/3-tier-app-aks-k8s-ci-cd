output "subnet_ids" {
  value = aws_subnet.subnets
}


output "subnet_cidr_block" {
  value = { for k, v in aws_subnet.subnets : k => v.cidr_block }
}
