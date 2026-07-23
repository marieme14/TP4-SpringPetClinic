resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.petclinic_vpc.id

  tags = {
    Name = "PetClinic-IGW"
  }

}