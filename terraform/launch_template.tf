data "aws_ami" "amazonlinux" {

  most_recent = true

  owners = ["amazon"]


  filter {

    name = "architecture"

    values = ["x86_64"]

  }


  filter {

    name = "name"

    values = ["al2023-ami-*"]

  }

}



resource "aws_launch_template" "petclinic_lt" {


  name_prefix = "petclinic-"


  image_id = data.aws_ami.amazonlinux.id


  instance_type = "t3.micro"



  vpc_security_group_ids = [

    aws_security_group.ec2_sg.id

  ]



  iam_instance_profile {


    name = aws_iam_instance_profile.profile.name


  }



  user_data = base64encode(file("user_data.sh"))



  monitoring {

    enabled = true

  }



  tag_specifications {


    resource_type = "instance"


    tags = {


      Name = "PetClinic"


    }

  }

}