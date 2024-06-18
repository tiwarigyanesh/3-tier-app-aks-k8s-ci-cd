output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.subnets.subnet_ids
}

output "gateway_id" {
  value = module.gateway.gateway_id
}

output "instance_ids" {
  value = module.ec2_instances.instance_ids
}

output "public_ips" {
  value = module.ec2_instances.public_ips
}

output "route_table_id" {
  value = module.route_tables.main_route_table_id
}

output "subnet_associations_ids" {
  value = module.route_tables.subnet_associations_ids
}


