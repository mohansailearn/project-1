echo $KOPS_CLUSTER_NAME
echo $KOPS_STATE_STORE
aws s3 ls
aws configure list
vim .bashrc
source .bashrc
echo $KOPS_STATE_STORE
kops create cluster --state=${KOPS_STATE_STORE} --node-count=2 --control-plane-size=t3.medium --node-size=t3.medium --zones=ap-south-1a --name=${KOPS_CLUSTER_NAME} --dns private --control-plane-count=1
kops create cluster --state=${KOPS_STATE_STORE} --node-count=2 --master-size=t3.medium --node-size=t3.medium --zones=ap-south-1 --name=${KOPS_CLUSTER_NAME} --dns private --master-count 1
kops create cluster --state=${KOPS_STATE_STORE} --node-count=2 --master-size=m7i-flex.large --node-size=m7i-flex.large --zones=ap-south-1 --name=${KOPS_CLUSTER_NAME} --dns private --master-count 1
export AWS_REGION=ap-south-1
export AWS_DEFAULT_REGION=ap-south-1
export KOPS_CLUSTER_NAME=myproject01.in
export KOPS_STATE_STORE=s3://myproject01.in
kops create cluster   --state=${KOPS_STATE_STORE}   --name=${KOPS_CLUSTER_NAME}   --cloud=aws   --zones=ap-south-1a   --node-count=2   --node-size=m7i-flex.large   --control-plane-size=m7i-flex.large   --control-plane-count=1   --dns private
aws route53 list-hosted-zones --query "HostedZones[*].[Name,Config.PrivateZone,Id]" --output table
kops create cluster   --state=${KOPS_STATE_STORE}   --name=${KOPS_CLUSTER_NAME}   --cloud=aws   --zones=ap-south-1a   --node-count=2   --node-size=m7i-flex.large   --control-plane-size=m7i-flex.large   --control-plane-count=1   --dns private
kops validate cluster
exit
