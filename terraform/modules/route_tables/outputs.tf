output "main_route_table_id" {
  value = aws_route_table.main_route_table.id
}

output "route_id" {
  value = aws_route.route.id
}

output "subnet_associations_ids" {
  value = { for k, v in aws_route_table_association.subnet_association : k => v.subnet_id }
}
