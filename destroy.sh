


DIR="$( cd "$( dirname "$0" )" && pwd -P )"

cd $DIR/apne2/prod/ec2/dmz_app ; terraform init
terraform destroy -auto-approve

cd $DIR/apne2/prod/ec2/bastion ; terraform init
terraform destroy -auto-approve

cd $DIR/apne2/prod/network/vpc ; terraform init
terraform destroy -auto-approve





