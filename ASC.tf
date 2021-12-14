# Autoscaling Launch Configuration

resource "aws_launch_configuration" "Project6_ASC" {
  name_prefix   = "projct6_asc"
  image_id      = "ami-04dd4500af104442f"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}








