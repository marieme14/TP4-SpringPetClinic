resource "aws_vpc" "petclinic_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "PetClinic-VPC"
  }
}