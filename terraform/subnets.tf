resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.petclinic_vpc.id
  cidr_block              = var.public_subnet1
  availability_zone       = "eu-west-3a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.petclinic_vpc.id
  cidr_block              = var.public_subnet2
  availability_zone       = "eu-west-3b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.petclinic_vpc.id
  cidr_block        = var.private_subnet1
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.petclinic_vpc.id
  cidr_block        = var.private_subnet2
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Private-Subnet-2"
  }
}