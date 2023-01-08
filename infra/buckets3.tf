resource "aws_s3_bucket" "bucket-server" {

  bucket = "server01-bucket-cronjob"
  acl    = "private"

  tags = {

    Name        = "My bucket"
    Environment = var.env

  }

  # vpc_security_group_ids = [ aws_security_group.mysecuritygroup.vpc_security_group_id ]


}