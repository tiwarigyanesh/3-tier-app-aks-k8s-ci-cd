output "instance_ids" {
  value = { for k, v in aws_instance.ec2_instances : k => v.id }
}

output "public_ips" {
  value = { for k, v in aws_instance.ec2_instances : k => v.public_ip }
}
