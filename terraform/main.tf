resource "aws_instance" "ec2" {
  count         = 3
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t3.micro"
  tags = {
    Name        = "web-${count.index}"
    Environment = "prod"
    Role        = "web"
    ManagedBy   = "terraform"
  }
}