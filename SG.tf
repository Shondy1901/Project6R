
resource "aws_security_group" "Project6_SG" {
  name        = "Project6_SG"
  description = "Enable SSH and HTTP access on ports 22/80"
  vpc_id      = aws_vpc.Project6_VPC.id 

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "Project6_SG"
  }
}