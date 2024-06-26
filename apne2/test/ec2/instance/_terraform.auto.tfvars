env   = "test"
name  = "cns-lsw-bastion-tf"
owner = "cns-lsw"
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
app_count           = 1
instance_type       = "t3.micro"
key_name            = "cns-lsw-pubkey"
detailed_monitoring = true
ec2_tags            = { monitoring : true }

# ssh sg
ssh_sg_description      = "SSH Security group for Bastion EC2 instance"
ssh_ingress_cidr_blocks = ["165.225.229.31/32"] ## me bespin
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