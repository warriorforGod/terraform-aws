provider "aws" {
  region = "us-west-2"
}

provider "random" {}

resource "random_pet" "name" {}

resource "aws_instance" "web" {
  ami           = "ami-0a940cb939351ccca"
  instance_type = "t2.micro"
  user_data     = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.allow-http-sg.id]

  tags = {
    Name = random_pet.name.id
  }
}

resource "aws_security_group" "allow-http-sg" {
  name        = "${random_pet.name.id}"
  description = "Allow http inbound traffic"

  ingress {
    description       = "Http from VPC"
    from_port         = 80
    protocol          = "tcp"
    to_port           = 80
    cidr_blocks       = ["0.0.0.0/0"]
  }

  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http-sg"
  }
}
