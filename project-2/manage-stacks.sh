#!/bin/bash
AWS_OPTS="--profile udacity"
AWS_REGION=us-east-1
ACTION=$1-stack
STACK_NAME=$2
STACK_BODY=$2.yml
STACK_PARAMETERS=$2-params.json
case $1 in
    "create"|"update")
        aws $AWS_OPTS cloudformation $ACTION --stack-name $STACK_NAME --template-body file://$STACK_BODY  --parameters file://$STACK_PARAMETERS --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$AWS_REGION
        ;;
    "delete")
        aws $AWS_OPTS cloudformation $ACTION --stack-name $STACK_NAME --region=$AWS_REGION
        ;;
esac
