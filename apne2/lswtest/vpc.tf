

### vpc.tf

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cns-lsw-testvpc"   ## 콘솔상 네임
    Owner = "cns-lsw"
  }
}


resource "aws_subnet" "publicSubnet1" {
  vpc_id            = aws_vpc.vpc.id ## 상단 VPC 의 id 레퍼런스 
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "cns-lsw-public-subnet-01"
  }
}

resource "aws_subnet" "publicSubnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "cns-lsw-public-subnet-02"
  }
}

## private rds subnet
resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "cns-lsw-private-subnet-01"
  }
}

resource "aws_subnet" "privateSubnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "cns-lsw-private-subnet-02"
  }
}

resource "aws_internet_gateway" "testIGW" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "cns-lsw-IGW"
  }
}