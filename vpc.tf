resource "aws_vpc" "demo" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${local.common_tag}-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo.id
  tags = {
    Name = "${local.common_tag}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.demo.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${local.common_tag}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Name = "${local.common_tag}-private-subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.demo.id
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${local.common_tag}-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.demo.id
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${local.common_tag}-private-rt"
  }
}
resource "aws_eip" "demo" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.demo.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "${local.common_tag}-nat-gw"
  }
  depends_on = [aws_internet_gateway.gw]
}