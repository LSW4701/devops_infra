module "ec2" {
  count  = length(local.target_names)
  source = "terraform-aws-modules/ec2-instance/aws"

  name = local.target_names[count.index]

  ami                         = local.ami_id
  key_name                    = local.key_name
  instance_type               = local.instance_type
  availability_zone           = element(local.azs, count.index % 2)
  subnet_id                   = element(local.private_subnet_ids, count.index % 2)
  vpc_security_group_ids      = [module.ssh.security_group_id, local.default_sg_id]
  iam_instance_profile        = module.iam.iam_instance_profile_name
  # associate_public_ip_address = true
  monitoring                  = var.detailed_monitoring
  user_data                   = data.template_file.userdata.rendered
  metadata_options            = var.metadata_options
  tags                        = merge(local.tags, var.ec2_tags)
}

module "ssh" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.ssh_sg_name
  description = local.ssh_sg_description
  vpc_id      = local.vpc_id

  ingress_with_cidr_blocks = local.ingress_with_cidr_blocks


  # ingress_cidr_blocks = local.ssh_ingress_cidr_blocks
  # ingress_rules       = local.ssh_ingress_rules
  # egress_rules        = local.ssh_egress_rules

  tags = local.tags
}

# iam
module "iam" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4.3"

  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false

  trusted_role_services   = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}