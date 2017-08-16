provider "aws" {
  region = "us-west-2"
}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  instance_class       = "db.t1.micro"
  name                 = "artdb"
  username             = "artifactory"
  password             = "password"
}

output "address" {
    value = "${aws_db_instance.default.address}"
}

output "port" {
    value = "${aws_db_instance.default.port}"
}
