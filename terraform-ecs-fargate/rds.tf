resource "aws_db_subnet_group" "database-subnet-group" {
  name = "database subnet"
  subnet_ids = aws_subnet.private.*.id
  description =  "Subnet for Database Instance"

  tags = {
    name = "Database Subnets"
  }

}


resource "aws_db_instance" "mysql_database" {
  identifier = "database-1"
  storage_type = "gp2"
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  port = "3306"
  db_subnet_group_name = aws_db_subnet_group.database-subnet-group.name
  name = "myDB"
  username = var.username
  password = var.password
  parameter_group_name = "default.mysql8.0"
  availability_zone = "eu-central-1a"
  multi_az = false
  vpc_security_group_ids = [aws_security_group.database-security-group.id]
  publicly_accessible = false
  deletion_protection = true
  skip_final_snapshot = true

  tags = {
    name = "proyecto-aws"
  }
}

