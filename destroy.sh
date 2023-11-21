


DIR="$( cd "$( dirname "$0" )" && pwd -P )"

cd $DIR/apne2/prod/alb/jenkins ; 
terraform destroy -auto-approve

cd $DIR/apne2/prod/ec2/jenkins ; 
terraform destroy -auto-approve

cd $DIR/apne2/prod/ec2/dmz_app ; 
terraform destroy -auto-approve

cd $DIR/apne2/prod/ec2/bastion ; 
terraform destroy -auto-approve

# cd $DIR/apne2/prod/network/vpc ; 
# terraform destroy -auto-approve
# vpc부분 잠정대기 




