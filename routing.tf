resource "aws_route_table" "application" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route" "application-default" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.application.id
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}

resource "aws_route_table_association" "app-private-a" {
  subnet_id      = aws_subnet.app-az-a.id
  route_table_id = aws_route_table.application.id
}

resource "aws_route_table_association" "app-private-b" {
  subnet_id      = aws_subnet.app-az-b.id
  route_table_id = aws_route_table.application.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route" "public-default" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.public-az-a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-b" {
  subnet_id      = aws_subnet.public-az-b.id
  route_table_id = aws_route_table.public.id
}