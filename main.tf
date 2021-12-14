#VPC

resource "aws_vpc" "Project6_VPC" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Project6_VPC"
  }
}

# Private Subnet

resource "aws_subnet" "Pri_Sub_1" {
  vpc_id     = aws_vpc.Project6_VPC.id
  cidr_block = var.pri_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Pri_Sub_1"
  }
}

# Private Subnet

resource "aws_subnet" "Pri_Sub_2" {
  vpc_id     = aws_vpc.Project6_VPC.id
  cidr_block = var.pri_cidr_2
  availability_zone = "eu-west-1c"

  tags = {
    Name = "Pri_Sub_2"
  }
}

# Public Subnet

resource "aws_subnet" "Pub_Sub_1" {
  vpc_id            = aws_vpc.Project6_VPC.id
  cidr_block        = var.pub_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Pub_Sub_1"
  }
}

# Public Subnet

resource "aws_subnet" "Pub_Sub_2" {
  vpc_id            = aws_vpc.Project6_VPC.id
  cidr_block        = var.pub_cidr_2
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Pub_Sub_2"
  }
}


# Private Route Table

resource "aws_route_table" "Pri_RT" {
  vpc_id = aws_vpc.Project6_VPC.id

  route = []

  tags = {
    Name = "Pri_RT"
  }
}


# Public Route Table

resource "aws_route_table" "Pub_RT" {
  vpc_id = aws_vpc.Project6_VPC.id

  route = []

  tags = {
    Name = "Pub_RT"
  }
}

# Private Subnet association to Private Route Table

resource "aws_route_table_association" "Pri_Sub_RT" {
  subnet_id      = aws_subnet.Pri_Sub_1.id
  route_table_id = aws_route_table.Pri_RT.id
}

# Public Subnet association to Public Route Table

resource "aws_route_table_association" "Pub_Sub_RT" {
  subnet_id      = aws_subnet.Pub_Sub_1.id
  route_table_id = aws_route_table.Pub_RT.id
}

# Public Subnet association to Public Route Table

resource "aws_route_table_association" "Pub_Sub_RT2" {
  subnet_id      = aws_subnet.Pub_Sub_2.id
  route_table_id = aws_route_table.Pub_RT.id
}

  # Internet Gateway

  resource "aws_internet_gateway" "Project6_IGW" {
    vpc_id = aws_vpc.Project6_VPC.id

    tags = {
      Name = "Project6_IGW"
    }
  }

  # Internet Gateway association to Public RT

  resource "aws_route" "Pub_RT_IGW" {
    route_table_id         = aws_route_table.Pub_RT.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.Project6_IGW.id
  }




