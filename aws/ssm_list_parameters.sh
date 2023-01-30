#/bin/bash

aws ssm describe-parameters --query Parameters[*].Name
