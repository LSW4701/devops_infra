DIR="$( cd "$( dirname "$0" )" && pwd -P )"

cd $DIR/apne2/prod/network/vpc ; terraform init ; terraform apply -auto-approve

cd $DIR/apne2/prod/ec2/dmz_app ; terraform init ; terraform apply -auto-approve

cd $DIR/apne2/prod/ec2/bastion ; terraform init ; terraform apply -auto-approve

cd $DIR/apne2/prod/ec2/jenkins; terraform init ; terraform apply -auto-approve

cd $DIR/apne2/prod/alb/jenkins ; terraform init ; terraform apply -auto-approve

