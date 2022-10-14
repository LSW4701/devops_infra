terraform {

  backend "s3" {
    bucket = "lsw-bbk"             #   버켓명 
    key = "terra1/terraform.tfstate"  #  생성되는 폴더/파일명  
    region = "ap-northeast-2"
    
    max_retries = 3
  }


#   backend "s3" {
#     bucket      = "devops-prod-tfbackend-s3"
#     key         = "apne2/ec2/dmz_app/terraform.tfstate"
#     region      = "ap-northeast-2"
#     role_arn    = "arn:aws:iam::552661052297:role/terraform-runner-role"
#     max_retries = 3
#   }
}
