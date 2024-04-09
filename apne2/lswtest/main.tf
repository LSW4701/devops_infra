terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" ## 5.0보다 높은 버젼을 사용할것을 명시 
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}



