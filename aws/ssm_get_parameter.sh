#!/bin/bash

set -x
PARAM_NAME=$1
aws ssm get-parameter --name $PARAM_NAME --with-decryption 

