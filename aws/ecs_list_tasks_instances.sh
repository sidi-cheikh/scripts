#!/bin/bash
CLUSTER_NAME=bpocecs-cluster
CONTAINER_INSTANCE="$(aws ecs list-container-instances --cluster $CLUSTER_NAME --query 'containerInstanceArns[]' --output text)"
for container in $CONTAINER_INSTANCE; do
TASK=$(aws ecs list-tasks --cluster $CLUSTER_NAME --container-instance $container --query 'taskArns[]' --output text)
EC2_INSTANCE_ID=$(aws ecs describe-container-instances --cluster $CLUSTER_NAME --container-instances $container --region us-east-1 --query 'containerInstances[*].ec2InstanceId' --output text)
echo "**************************************"
echo "ECS TASK having ARN is $TASK"
echo "Running in EC2 instance having ID $EC2_INSTANCE_ID" 
done
