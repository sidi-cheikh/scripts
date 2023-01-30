#!/bin/bash
#
# Description
# 	retun the private ips of a loadbalancer

LB_NAME="$1"

set -x

aws ec2 describe-network-interfaces --filters Name=description,Values="ELB *${LB_NAME}*" --query 'NetworkInterfaces[*].PrivateIpAddresses[*].PrivateIpAddress' --output text
