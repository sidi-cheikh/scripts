#!/bin/bash
#
# DESCRIPTION
# 	list vpcs in others accounts that are associated with 
# 	specific private hosted zone
#	see: https://aws.amazon.com/premiumsupport/knowledge-center/route53-private-hosted-zone/

set -x

aws route53 list-vpc-association-authorizations --hosted-zone-id $1
