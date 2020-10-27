resource "aws_internet_gateway" "igw" {
  vpc_id            = aws_vpc.main.id
  tags = {
    Name            = "InternetGateWay-${var.ENV}"
    Environment     = var.ENV
  }
}