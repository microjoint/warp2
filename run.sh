#!/bin/bash 

if [ $# -ne 2 ]
then
    echo "Please ser role e.g. pc, laptop"
    exit 1
fi

FACTER_role=$1 FACTER_environment=$2 puppet apply /etc/puppet/manifests/site.pp
#FACTER_role=$2 puppet apply --verbose --debug /etc/puppet/manifests/site.pp
