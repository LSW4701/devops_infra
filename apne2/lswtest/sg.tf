# sg.tf
## public Seucurity Group
resource "aws_security_group" "publicSG01" {
  name        = "cns-lsw-public-sg-01"
  description = "Allow all HTTP"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "For http port"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "For http port"
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "For ssh port"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

## private Security Group
resource "aws_security_group" "privateSG01" {
  name        = "cns-lsw-private-sg-01"
  description = "Allow mysql"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "bas  port"
    security_groups  = aws_security_group.publicSG01.id
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}