


DIR="$( cd "$( dirname "$0" )" && pwd -P )"

cd $DIR/apne2/test/alb/dmz/ ; 
terraform destroy -auto-approve

cd $DIR/apne2/test/ec2/dvwa/ ; 
terraform destroy -auto-approve

cd $DIR/apne2/test/ec2/instance ; 
terraform destroy -auto-approve


cd $DIR/apne2/test/network/vpc ; 
terraform destroy -auto-approve

# cd $DIR/apne2/prod/network/vpc ; 
# terraform destroy -auto-approve
# vpc부분 잠정대기 


