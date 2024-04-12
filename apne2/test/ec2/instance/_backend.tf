### lswtest_waf테스트 목적 _20240412

terraform {
  backend "s3" {
    bucket      = "cns-lsw-backend-tf" ##
    key         = "apne2/test/ec2/instance/terraform.tfstate"
    region      = "ap-northeast-2"
#    role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
  }
}
