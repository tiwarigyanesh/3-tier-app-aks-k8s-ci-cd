
resource "aws_security_group" "frontend_security_group" {
  name        = var.frontend_security_group_name
  description = "Allow traffic on public VM"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = var.egress_rules.from_port
    to_port     = var.egress_rules.to_port
    protocol    = var.egress_rules.protocol
    cidr_blocks = var.egress_rules.cidr_blocks
  }

  tags = {
    Name = var.frontend_security_group_name
  }
}


resource "aws_security_group" "backend_security_group" {
  name        = var.backend_security_group_name
  description = "Allow traffic on public VM"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = var.egress_rules.from_port
    to_port     = var.egress_rules.to_port
    protocol    = var.egress_rules.protocol
    cidr_blocks = var.egress_rules.cidr_blocks
  }

  tags = {
    Name = var.backend_security_group_name
  }
}


resource "aws_security_group" "database_security_group" {
  name        = var.database_security_group_name
  description = "Allow traffic on public VM"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = var.egress_rules.from_port
    to_port     = var.egress_rules.to_port
    protocol    = var.egress_rules.protocol
    cidr_blocks = var.egress_rules.cidr_blocks
  }

  tags = {
    Name = var.database_security_group_name
  }
}
