#!/bin/bash
# 
# describe instace by its Name tag
#
# Usage
# ec2_describe_instance.sh mobilepoc1

NAME=${1-Instace_Name}

for instance_id in $(aws ec2 describe-instances --filter "Name=instance-state-name,Values=stopped"  --filter "Name=tag:Name,Values=$NAME" --query "Reservations[].Instances[].InstanceId" --output text)
do
	echo Starting $instance_id
	aws ec2 start-instances --instance-ids $instance_id
done

