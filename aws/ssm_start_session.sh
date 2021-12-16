#!/bin/bash
#
# DESCRIPTION
#	Starts an ssm session with an EC2 instance given its name
# ARGS
#	$1 : The name of the isntance to connect to
#
# Example
#   	./ssm_start_session.sh webserver1
#
# DEPENDENCIES:
#	this script relies on ec2_get_istance_id.sh to get the instannce id
#	and it should be located in nthe same folder as ec2_get_istance_id.sh to works


INSTANCE_NAME="$1"

CURRENT_DIR=$(dirname $0)

INSTANCE_ID=`${CURRENT_DIR}/ec2_get_instance_id.sh  $INSTANCE_NAME`

#starting the session
aws ssm start-session --target $INSTANCE_ID


