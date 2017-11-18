#!/bin/bash
if [ -f /etc/debian_version ]; then
  sudo apt-get install -y git python-pip python-dev ansible
  sudo apt-get install -y software-properties-common
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -y ansible
  sudo apt-get upgrade -y ansible
elif [ -f /etc/redhat-release ]; then
#  rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
  yum install -y epel-release
  yum install -y git python-pip python-devel python-dnf
fi


cd /vagrant ; git clone https://github.com/agrosshans/openldap-lanathome.git
ansible-playbook -i "localhost," -c local /vagrant/ansible-playbook.yml