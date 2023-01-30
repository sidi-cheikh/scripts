#/bin/bash

# DESCRIPTION
#	retun the list of SSM parameter that have the name matchinng and input expressionn
# 	the nname and value of parameters will be displayed in the fomat Name=Value
#
# EXAMPLE
#	./aws_ssm_get_parameters.sh "eis*password" : this will display all the ssm parameter 
#						     that a have a name matchinng "*eis*password*
#        
#
PATTERN="$1"

aws ssm describe-parameters --query Parameters[*].Name | jq .[] -r | grep "$PATTERN"  | xargs echo | xargs -n 10 aws ssm get-parameters --with-decryption --names | jq -r '.Parameters[] | "\(.Name)=\(.Value)"'

