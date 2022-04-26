resource "aws_vpc" "vpc_name" {
  cidr_block = "10.0.3.0/28"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet_name" {
  vpc_id = aws_vpc.vpc_name.id
  cidr_block = "10.0.3.0/28"
  availability_zone = "us-east-1a"

  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_internet_gateway" "vpc_igw_name" {
  vpc_id = aws_vpc.vpc_name.id

  tags = {
    Name = var.vpc_igw_name
  }
}

resource "aws_route_table" "my_vpc_us_east_1a_public" {
  vpc_id = aws_vpc.vpc_name.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw_name.id
  }
}

resource "aws_route_table_association" "my_vpc_us_east_1a_public" {
  subnet_id = aws_subnet.public_subnet_name.id
  route_table_id = aws_route_table.my_vpc_us_east_1a_public.id
}

resource "aws_security_group" "allow-ssh-sg" {
  name        = "allow-ssh-sg"
  description = "Allow ssh inbound traffic"
  vpc_id = aws_vpc.vpc_name.id

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }
}

resource "aws_instance" "instance_name" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.allow-ssh-sg.id]
  subnet_id = aws_subnet.public_subnet_name.id
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  key_name = "laptop"
  security_groups = [ "${aws_security_group.allow-ssh-sg.id}"]
}

