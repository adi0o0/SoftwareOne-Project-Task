# Private application subnet 1
resource "aws_subnet" "app-az-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "eu-south-1a"
}

# Private application subnet 2
resource "aws_subnet" "app-az-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "eu-south-1b"
}

# Private database subnet 1
resource "aws_subnet" "db-az-a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "eu-south-1a"
}

# Private database subnet 2
resource "aws_subnet" "db-az-b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.10.4.0/24"
  availability_zone = "eu-south-1b"
}

# Private database subnet 3
resource "aws_subnet" "db-az-c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.10.5.0/24"
  availability_zone = "eu-south-1c"
}

# Public subnet 1
resource "aws_subnet" "public-az-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.6.0/24"
  availability_zone       = "eu-south-1a"
  map_public_ip_on_launch = true
}

# Public subnet 2
resource "aws_subnet" "public-az-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.10.7.0/24"
  availability_zone       = "eu-south-1b"
  map_public_ip_on_launch = true
}