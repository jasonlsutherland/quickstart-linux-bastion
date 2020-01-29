#!/bin/bash

echo "Destroying CloudFormation Stack..."

aws cloudformation delete-stack --stack-name ${STACK_NAME}

echo "Waiting for CloudFormation stack to destroy..."

aws cloudformation wait stack-delete-complete --stack-name ${STACK_NAME}

echo "Blueprint has been destroyed..."