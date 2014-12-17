#!/bin/bash 

if [ $# -ne 1 ]
then
    echo "Please ser role e.g. pc, laptop"
    exit 1
fi

FACTER_role=$1 puppet apply /etc/puppet/manifests/site.pp
#FACTER_role=$2 puppet apply --verbose --debug /etc/puppet/manifests/site.pp
