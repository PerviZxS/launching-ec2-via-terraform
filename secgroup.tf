resource "aws_security_group" "MY-SG" {
  name        = "MY-SG"
  description = "Just for fun ))"

  tags = {
    Name = "MY-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sshfromMyIP" {
  security_group_id = aws_security_group.MY-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allowhttp" {
  security_group_id = aws_security_group.MY-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allowalloutboundIPv4" {
  security_group_id = aws_security_group.MY-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allowalloutboundIPv6" {
  security_group_id = aws_security_group.MY-SG.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}