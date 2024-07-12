provider "aws" {
  region = "us-west-2" # Change to your preferred region
}

resource "aws_instance" "example" {
  ami           = "ami-078701cc0905d44e4" # Amazon Linux 2 AMI ID for us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "EC2Instance"
  }

  key_name = "MuaviaKey" # Change to your key pair name

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /var/www/html/index.html
              EOF
}

resource "aws_security_group" "example" {
  name_prefix = "example-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
