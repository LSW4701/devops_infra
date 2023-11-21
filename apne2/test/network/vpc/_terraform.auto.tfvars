env    = "test"
name   = "cns-lsw-test-tf"
owner  = "cns-lsw"
region = "ap-northeast-2"

vpc_cidr       = "10.0.0.0/16"
azs            = ["ap-northeast-2a", "ap-northeast-2c"]
public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

enable_ipv6        = false
enable_nat_gateway = false

public_subnet_tags = { "kubernetes.io/role/elb" : 1 }
vpc_tags           = {}
tags               = {}
