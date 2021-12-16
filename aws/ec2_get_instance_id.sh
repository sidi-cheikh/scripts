#!/bin/bash
#
# DESCRIPTION
#	lookup an ec2 instance by its name and returns its id
#
# Arguments
#	$1 : the instance name 
#

INSTANCE_NAME="$1"

aws ec2 describe-instances --filter "Name=tag:Name,Values=$INSTANCE_NAME" --query Reservations[*].Instances[*].InstanceId --output text

