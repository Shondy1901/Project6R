# RDS

resource "aws_db_instance" "project6_DB" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "project6"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.project6_Sub_Group.id
  
}

#DB Subnet Group

resource "aws_db_subnet_group" "project6_Sub_Group" {
  name       = "project sub group"
  subnet_ids = [aws_subnet.Pri_Sub_1.id, aws_subnet.Pri_Sub_2.id]

  tags = {
    Name = "project6 sub group"
  }
}

# DB Security Instance

resource "aws_security_group" "project6_db_sg" {
  name        = "project6_db_sg"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.Project6_VPC.id 

  ingress {
    description      = "HTTP from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "project6_db_sg"
  }
}