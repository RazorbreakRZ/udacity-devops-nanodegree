#!/bin/bash
AWS_OPTS="--profile udacity"
BUCKET_NAME=$1
aws $AWS_OPTS s3 sync ./webapp-content s3://$BUCKET_NAME --delete