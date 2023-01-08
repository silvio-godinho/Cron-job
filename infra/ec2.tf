resource "aws_instance" "server" {

  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name        = var.name
    Enviroment  = var.env
    Provisioner = "Terraform"
    Repo        = var.repo
  }

  # vpc_security_group_ids = [ aws_security_group.mysecuritygroup.vpc_security_group_id ]


}

