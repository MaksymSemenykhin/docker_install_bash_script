#!/bin/bash
source <(curl -s https://raw.githubusercontent.com/MaksymSemenykhin/bash_scripts/master/output.sh)
dockerFolder="/docker"

print_title 'SET UP THE REPOSITORY'

print_info 'Updating the apt package index'
sudo apt-get update -qq

print_info 'Installing packages to allow apt to use a repository over HTTPS'
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -yqq

print_info 'Addiing Docker’s official GPG key'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

print_info 'Adding stable repository'
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

print_title 'Updating the apt package index'

print_info 'Update the apt package index'
sudo apt-get update  -qq

print_info 'Installing the latest version of Docker Engine - Community and containerd'
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose  -yqq

print_title 'Folders prepare'
mkdir $dockerFolder -p

print_title 'Result:'
docker -v
docker-compose -v
