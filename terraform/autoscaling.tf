resource "aws_autoscaling_group" "petclinic_asg" {

  name = "petclinic-asg"

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = [

    aws_subnet.private_subnet_1.id,

    aws_subnet.private_subnet_2.id

  ]

  target_group_arns = [

    aws_lb_target_group.petclinic_tg.arn

  ]

  launch_template {

    id = aws_launch_template.petclinic_lt.id

    version = "$Latest"

  }

}