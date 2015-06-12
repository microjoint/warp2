#!/bin/bash 

if [ $# -ne 3 ]
then
  echo "Please supply environment(work,home) hardware(workstation,laptop,tablet) role(desktop,server,fridge)"
  exit 1
fi

FACTER_environment=$1 FACTER_hardware=$2 FACTER_role=$3 puppet apply /etc/puppet/manifests/site.pp
