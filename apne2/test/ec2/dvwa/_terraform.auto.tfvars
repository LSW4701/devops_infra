env   = "test"
name  = "cns-lsw-dvwa-tf"
owner = "cns-lsw"
tags  = {}

# AMI
ami_id = "ami-0d1c657f89a7ccab7"  ## 기존에생성된 DVWA, 
ami_owners = ["amazon"]
ami_filters = [
  {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
]

# EC2
app_count           = 1
instance_type       = "t3.micro"
key_name            = "cns-lsw-pubkey"
detailed_monitoring = true
ec2_tags            = { monitoring : true }

# ssh sg
ssh_sg_description      = "SSH Security group for Bastion EC2 instance"
ingress_with_cidr_blocks = [
    {
      from_port   = 443                                #인바운드 시작 포트
      to_port     = 443                                #인바운드 끝나는 포트
      protocol    = "tcp"                              #사용할 프로토콜
      description = "https"                            #설명
      cidr_blocks = "0.0.0.0/0"                        #허용할 IP 범위
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "165.225.229.31/32"
    }
]


ssh_ingress_rules       = ["ssh-tcp"]
ssh_egress_rules        = ["all-all"]

# iam
trusted_role_services = ["ec2.amazonaws.com"]
custom_role_policy_arns = [
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
  "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
]

metadata_options = {
  http_tokens = "required"
  http_put_response_hop_limit = "1"
}