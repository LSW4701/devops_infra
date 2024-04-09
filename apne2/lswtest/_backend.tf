terraform {
  backend "s3" {
    bucket = "cns-lsw-backend-tf"
    key    = "apne2/ec2/dmz_app/terraform.tfstate" # 백엔드에 생성되는 폴더명 
    region = "ap-northeast-2"
    #    role_arn    = "{ASSUMED_ROLE}"# dd
    max_retries = 3
  }
}