resource "aws_route_table" "main_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.main_route_table.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
}

resource "aws_route_table_association" "subnet_association" {
  for_each       = var.subnet_ids
  subnet_id      = each.value.id
  route_table_id = aws_route_table.main_route_table.id
}
