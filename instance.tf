resource "aws_instance" "ubuntu-server" {
  ami                    = data.aws_ami.ubuntu-server.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.EC2-1.key_name
  vpc_security_group_ids = [aws_security_group.MY-SG.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name = "Ubuntu-server-web"
  }
}