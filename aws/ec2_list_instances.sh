#!/bin/bash 
# list EC2 instance in the account

aws ec2 describe-instances --query "Reservations[].Instances[].Tags[?Key == 'Name' ]".Value --output text
