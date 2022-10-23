terraform {
  backend "s3" {
    bucket      = "devops-prod-tfbackend-s3"
    key         = "apne2/apne2/ec2/jenkins/terraform.tfstate"
    region      = "ap-northeast-2"
    role_arn    = "arn:aws:iam::959714228357:role/terraformAsume"
    max_retries = 3
  }
}


# terraform {
#   backend "s3" {
#     bucket      = "devops-dev-tfbackend-s3"
#     key         = "dev/apne2/ec2/jenkins/terraform.tfstate"
#     region      = "ap-northeast-2"
# #    role_arn    = "{ASSUMED_ROLE}"
#     max_retries = 3
#   }
# }
