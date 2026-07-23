resource "aws_security_group" "alb_sg" {

  name = "alb-sg"

  description = "Security Group ALB"

  vpc_id = aws_vpc.petclinic_vpc.id

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}
resource "aws_security_group" "ec2_sg" {

  name = "ec2-sg"

  vpc_id = aws_vpc.petclinic_vpc.id

  ingress {

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    security_groups = [aws_security_group.alb_sg.id]

  }

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}
resource "aws_security_group" "rds_sg" {

  name = "rds-sg"

  vpc_id = aws_vpc.petclinic_vpc.id

  ingress {

    from_port = 3306

    to_port = 3306

    protocol = "tcp"

    security_groups = [aws_security_group.ec2_sg.id]

  }

}