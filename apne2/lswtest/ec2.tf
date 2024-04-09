# ec2.tf
resource "aws_instance" "testEC201" {
  ami                         = "ami-0c031a79ffb01a803"
  # 2023 Amazon Linux 2023 AMI 2023.4.20240401.1 x86_64 HVM kernel-6.1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.publicSubnet1.id  ## 참조
  key_name                    = "cns-lsw-pubkey"  ## 내 키페어
  associate_public_ip_address = "true"  
  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  vpc_security_group_ids = [
    aws_security_group.publicSG01.id
  ]
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    tags = {
      "Name" = "cns-lsw-bastion-ebs"
    }
  }

  tags = {
    "Name" = "cns-lsw-bastion"
  }
}

resource "aws_instance" "testEC202" {
  ami                         = "ami-0c031a79ffb01a803" # al 2023
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.privateSubnet2.id
  key_name                    = "cns-lsw-pubkey"  ## 내 키페어
  #associate_public_ip_address = "true"
  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  vpc_security_group_ids = [
    aws_security_group.privateSubnet1.id
  ]
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    tags = {
      "Name" = "cns-lsw-bastion-private-ec2-02-vloume-1"
    }
  }

  tags = {
    "Name" = "cns-lsw-private"
  }
}