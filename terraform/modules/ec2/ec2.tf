locals {
  ec2_instances_with_sg = {
    for instance_name, instance in var.ec2_instances : instance_name => merge(
      instance,
      {
        subnet_id = instance_name == "frontend_ec2" ? var.subnet_ids["frontend_subnet"].id : instance_name == "backend_ec2" ? var.subnet_ids["backend_subnet"].id : var.subnet_ids["database_subnet"].id,

        security_group_id = instance_name == "frontend_instance" ? var.security_group_id["frontend"] : instance_name == "backend_instance" ? var.security_group_id["backend"] : var.security_group_id["database"]
      }
    )
  }
}

resource "aws_instance" "ec2_instances" {
  for_each = local.ec2_instances_with_sg

  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = each.value.key_name
  availability_zone           = each.value.availability_zone
  associate_public_ip_address = each.value.associate_public_ip_address
  vpc_security_group_ids      = [each.value.security_group_id]
  subnet_id                   = each.value.subnet_id

  tags = merge(each.value.tags, {
    "Name" = each.value.tags.Name
  })
}
