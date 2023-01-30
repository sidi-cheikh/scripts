#!/bin/bash

set -x

ZONE_ID="$1"
aws route53 list-resource-record-sets --hosted-zone-id $ZONE_ID 


