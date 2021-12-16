#!/bin/bash
# 
# describe instace by its Name tag
#
# Usage
# ec2_describe_instance.sh mobilepoc1

NAME=${1-*}

aws ec2 describe-instances  --filter "Name=tag:Name,Values=${NAME}"

