resource "aws_internet_gateway" "igw" {
  vpc_id            = aws_vpc.main.id
  tags              = {
    Name            = "InternetGateWay-${var.ENV}"
    Environment     = var.ENV
  }
}

resource "aws_eip" "nat" {
  vpc               = true
}

resource "aws_nat_gateway" "ngw" {
  count             = length(aws_subnet.public_subnet.*.id)
  allocation_id     = aws_eip.nat.id
  subnet_id         = element(aws_subnet.private_subnet.*.id, count.index)
}