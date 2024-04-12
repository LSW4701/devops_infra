terraform {
  backend "s3" {
    bucket = "cns-lsw-backend-tf"
    key    = "lsw_tftest_20240409" # 백엔드에 생성되는 폴더명 
    region = "ap-northeast-2"
    #    role_arn    = "{ASSUMED_ROLE}"# dd
    max_retries = 3
  }
}