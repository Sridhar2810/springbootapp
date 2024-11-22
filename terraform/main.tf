provider "aws" {
  region = "ap-south-1"  # Change to your desired region
}

resource "aws_instance" "hello-world-app" {
  ami           = "ami-0dee22c13ea7a9a67"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"               # Change instance type if needed

  key_name      = var.key_name

  security_groups = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "HelloWorldApp"
  }
}

resource "aws_security_group" "allow-ssh" {
  name        = "allow_ssh_unique"
  description = "Allow SSH inbound traffic"
  vpc_id     = "vpc-0abcfde67c0317c28"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to your IP for better security
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to your IP for better security
  }
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to your IP for better security
  }
    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change to your IP for better security
  }
  


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

