provider "aws" {
    region = "us-east-1"    
  
}

resource "aws_instance" "demo2" {
    ami = "ami-0e54eba7c51c234f6"
    instance_type = "t2.micro"
    key_name = "projectKey"
    security_groups = [ "demo_sg" ]

     
}
resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Allow SSh inbound traffic"
  

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
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
    Name = "demo sg"
  }
}

