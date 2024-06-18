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
