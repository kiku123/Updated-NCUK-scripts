resource "aws_vpc" "NCUK-vpc-preprod" {
  cidr_block = var.NCUK-vpc-cidr-block-preprod
  tags = {
    Name = "${var.NCUK-env-prefix-preprod}-vpc"
  }
}

#Adding the first subnet
resource "aws_subnet" "NCUK-private-subnet-preprod-1" {
  vpc_id            = aws_vpc.NCUK-vpc-preprod.id
  cidr_block        = var.NCUK-subnet-cidr-block-preprod
  availability_zone = var.NCUK-availability-zone-preprod
  tags = {
    Name = "${var.NCUK-env-prefix-preprod}-subnet-1"
  }
}

#Adding the second subnet
resource "aws_subnet" "NCUK-private-subnet-preprod-2" {
    vpc_id            = aws_vpc.NCUK-vpc-preprod.id
    cidr_block        = var.NCUK-subnet-cidr-block-preprod
    availability_zone = var.NCUK-availability-zone-preprod
    tags = {
    Name = "${var.NCUK-env-prefix-preprod}-subnet-2"
    }

}

#Adding the third subnetNCUK-preprod
resource "aws_subnet" "NCUK-public-subnet-preprod-1" {
    vpc_id            = aws_vpc.NCUK-vpc-preprod.id
    cidr_block        = var.NCUK-subnet-cidr-block-preprod
    availability_zone = var.NCUK-availability-zone-preprod
    tags = {
    Name = "${var.NCUK-env-prefix-preprod}-subnet-3"
    }

}

resource "aws_internet_gateway" "NCUK-int-gateway-preprod" {
  vpc_id = aws_vpc.NCUK-vpc-preprod.id
  tags = {
    Name = "${var.NCUK-env-prefix-preprod}-igw"
  }
}

resource "aws_default_route_table" "NCUK-main-rtbl-preprod" {
  default_route_table_id = aws_vpc.NCUK-vpc-preprod.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.NCUK-int-gateway-preprod.id
  }
  tags = {
    Name = "${var.NCUK-env-prefix-preprod}-main-rtbl-preprod"
  }
}

resource "aws_default_security_group" "NCUK-default-sg-preprod" {
  vpc_id = aws_vpc.NCUK-vpc-preprod.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.3.0.0/32"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.NCUK-env-prefix-preprod}-NCUK-default-sg-preprod"
  }
}
