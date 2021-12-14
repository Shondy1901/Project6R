# Application Load Balancer

resource "aws_lb" "Project6_ALB" {
  name               = "project6-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Project6_SG.id]
  subnets            = [aws_subnet.Pub_Sub_1.id, aws_subnet.Pub_Sub_2.id]

  enable_deletion_protection = true
}

# ALB Target Group

resource "aws_lb_target_group" "Project6_TG" {
  name     = "project6-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Project6_VPC.id
}

