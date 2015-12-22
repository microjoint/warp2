#!/bin/bash

if [ $# -ne 3 ]
then
  echo "Please supply environment(work,home) hardware(workstation,laptop,tablet) role(desktop,server,fridge)"
  exit 1
fi

#install puppet if it doesn't exist
if [[ ! -x "/usr/bin/puppet" ]]
then
  apt-get install -y puppet
fi


FACTER_environment=$1 FACTER_hardware=$2 FACTER_role=$3 puppet apply /etc/puppet/manifests/site.pp

if [[ $? -ne 0 ]]
then
  # Puppet run failed. Let's update the repo as this may contain the fix
  if [[ -d "/etc/puppet/.git" ]]
  then
    cd "/etc/puppet"
    git pull
  else
    echo 'cannot update. clone repo? (y/N)'
    read inupt
    if [[ $input == 'y' ]]
    then
      rm -rf /etc/puppet
      git clone --recursive https://github.com/microjoint/warp2.git /etc/puppet
    fi
  fi
fi

