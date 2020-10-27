resource "aws_route_table" "public" {
  vpc_id           = aws_vpc.main.id
  route {
    cidr_block     = var.IGW_CIDR
    gateway_id     = aws_internet_gateway.igw.id
  }
  tags = {
    Name           = "public-route-table"
    Environment    = var.ENV
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnet.*.id)
  route_table_id = aws_route_table.public.id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}