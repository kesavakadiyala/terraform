resource "aws_vpc" "main" {
  cidr_block     = var.VPC_CIDR
  tags = {
    Name         = "Roboshop_VPC-${var.ENV}"
    Environment  = var.ENV
  }
}

