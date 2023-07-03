#!/bin/bash

# List the names of aws instance in the account

NAME_FILTER="${1-*}"

aws ec2 describe-instances --filter "Name=tag:Name,Values=$NAME_FILTER" --query 'Reservations[*].Instances[*].Tags[?Key==`Name`].Value' --output text

