locals {
  subnet_az_map = {
    "frontend" = 0
    "backend"  = 1
    "database" = 2
  }
}

resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = each.value
  availability_zone       = data.aws_availability_zones.available.names[local.subnet_az_map[each.key]]
  map_public_ip_on_launch = true

  tags = {
    Name = each.key
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}