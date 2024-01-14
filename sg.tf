resource "aws_security_group" "k8s-sg" {
  name        = var.sg-name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = var.sg-name
  }
}

resource "aws_security_group_rule" "allow_https" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_tls_http" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_tls_ssh" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_tls_bitbucket" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "ingress"
  from_port         = 7990
  to_port           = 7990
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
#########################################################
#               OPEN FOR WORLD

resource "aws_security_group_rule" "allow_all_ingress" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"  # -1 represents all protocols
  cidr_blocks       = ["0.0.0.0/0"]
}

##########################################################

resource "aws_security_group_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.k8s-sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}



