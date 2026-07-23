resource "aws_autoscaling_attachment" "petclinic_attachment" {

  autoscaling_group_name = aws_autoscaling_group.petclinic_asg.id

  lb_target_group_arn = aws_lb_target_group.petclinic_tg.arn

}