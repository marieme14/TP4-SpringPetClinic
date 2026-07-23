resource "aws_lb" "petclinic_alb" {


  name = "petclinic-alb"


  load_balancer_type = "application"


  security_groups = [

    aws_security_group.alb_sg.id

  ]


  subnets = [

    aws_subnet.public_subnet_1.id,

    aws_subnet.public_subnet_2.id

  ]


}
resource "aws_lb_target_group" "petclinic_tg" {


  name = "petclinic-target"


  port = 8080


  protocol = "HTTP"


  vpc_id = aws_vpc.petclinic_vpc.id



  health_check {


    path = "/"


    port = "8080"


  }


}
resource "aws_lb_listener" "petclinic_listener" {


  load_balancer_arn = aws_lb.petclinic_alb.arn


  port = 80


  protocol = "HTTP"



  default_action {


    type = "forward"


    target_group_arn = aws_lb_target_group.petclinic_tg.arn


  }


}