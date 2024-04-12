


DIR="$( cd "$( dirname "$0" )" && pwd -P )"


cd $DIR/apne2/lswtest; 
terraform destroy -auto-approve


# cd $DIR/apne2/prod/network/vpc ; 
# terraform destroy -auto-approve
# vpc부분 잠정대기 




