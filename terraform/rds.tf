resource "aws_db_subnet_group" "petclinic_db_subnet" {

  name = "petclinic-db-subnet"

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "PetClinic DB subnet"
  }

}


resource "aws_db_instance" "petclinic_db" {

  identifier = "petclinic-mysql"

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20


  db_name = "petclinic"

  username = "admin"

  password = "PetClinic1234!"


  db_subnet_group_name = aws_db_subnet_group.petclinic_db_subnet.name


  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]


  publicly_accessible = false


  skip_final_snapshot = true


  tags = {

    Name = "PetClinic-RDS"

  }

}