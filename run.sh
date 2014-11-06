#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Please supply the root directory. it's usually '.'"
    echo "Please set env e.g. home, work"
    exit 1
fi

root=$1

FACTER_env=$2 puppet apply /etc/puppet/manifests/site.pp
#FACTER_env=$2 puppet apply --debug /etc/puppet/manifests/site.pp
