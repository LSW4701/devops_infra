env   = "dev"
name  = "bastion"
owner = "dj.kim"
tags  = {}

# AMI
ami_owners = ["amazon"]
ami_filters = [
  {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
]

# EC2
instance_type       = "t3.micro"
key_name            = "linux_s"
detailed_monitoring = true

# ssh sg
ssh_sg_description      = "SSH Security group for Bastion EC2 instance"
ssh_ingress_cidr_blocks = ["119.207.130.236/32"] # 
ssh_ingress_rules       = ["ssh-tcp"]
ssh_egress_rules        = ["all-all"]

# iam
trusted_role_services = ["ec2.amazonaws.com"]
custom_role_policy_arns = [
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
]

