#!/bin/bash

curl -s https://raw.githubusercontent.com/MaksymSemenykhin/docker_install_bash_script/master/docker_install.sh -H "Cache-Control: no-cache" | bash 

dockeruser="ubuntu"
dockerFolder="/docker"

print_title "Set $dockeruser user as docker folder owner"
chown $dockeruser:$dockeruser $dockerFolder -R

print_title "Add $dockeruser user to docker group"
sudo groupadd docker
sudo usermod -aG docker $dockeruser

