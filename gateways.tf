resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "nat-gw" {
  depends_on = [aws_internet_gateway.igw]
  domain     = "vpc"
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat-gw.id
  subnet_id     = aws_subnet.public-az-a.id
}