#!/bin/bash

# Decripiton
#   Enable termination protection on a specified instance. The name of the specified instance can incule a wildcard to match mutiple instances
#
#   created 02/23/2023 -Sidi

INSTANCE_NAMES="$1"

aws ec2 describe-instances --filter "Name=tag:Name,Values=$INSTANCE_NAMES" --query Reservations[*].Instances[*].InstanceId --output text |
	xargs -n 1  aws ec2 modify-instance-attribute --disable-api-termination  --instance-id


