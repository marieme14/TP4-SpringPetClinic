resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {

  alarm_name = "PetClinicCPU"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 120

  statistic = "Average"

  threshold = 70

  alarm_description = "CPU > 70%"

}