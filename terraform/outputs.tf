output "alb_dns" {

  value = aws_lb.petclinic_alb.dns_name

}

output "rds_endpoint" {

  value = aws_db_instance.petclinic_db.endpoint

}

output "vpc_id" {

  value = aws_vpc.petclinic_vpc.id

}