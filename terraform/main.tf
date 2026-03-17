resource "aws_instance" "devops_server" {
  ami           = "ami-0c94855ba95c71c99"  # Example AMI, update with your region
  instance_type = "t2.micro"

  tags = {
    Name = "DevOpsServer"
  }
}
