#!/bin/bash
#
# DESCRIPTION
#	Starts an ssm port forwarding session with an EC2 instance given its name
# ARGS
#	$1 : The name of the isntance to connect to
#	$2 : The post to forward
#	$3 : the local port to forward to
# Example
#   	./ssm_start_port_forwarding.sh webserver1 80 8080
#	this will forward port 80 on the EC2 to 8080 on the client machine
#
# DEPENDENCIES:
#	this script relies on ec2_get_istance_id.sh to get the instannce id
#	and it should be located in nthe same folder as ec2_get_istance_id.sh to works
#

set -x

INSTANCE_NAME="$1"

REMOTE_PORT="$2"

LOCAL_PORT="$3"

CURRENT_DIR=$(dirname $0)

INSTANCE_ID=`${CURRENT_DIR}/ec2_get_instance_id.sh  $INSTANCE_NAME`

#starting the session
aws ssm start-session --target $INSTANCE_ID \
	--document-name AWS-StartPortForwardingSession \
	--parameters "{\"portNumber\":[\"$REMOTE_PORT\"], \"localPortNumber\":[\"$LOCAL_PORT\"]}"


