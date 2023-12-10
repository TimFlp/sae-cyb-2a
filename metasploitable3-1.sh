#!/bin/bash

apt update -y && apt upgrade -y && apt install curl git sudo -y
echo "[*] Installation VirtualBox..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian bookworm contrib" >> /etc/apt/sources.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
apt-get update -y && apt-get install virtualbox-7.0 -y

echo "[*] Installation Packer..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update -y && apt install packer && apt --fix-broken install -y
echo "[*] Installation Vagrant..."
apt install vagrant -y 

echo "[*] Installation du plugin Vagrant reload et Virtualbox..."
vagrant plugin install vagrant-reload
packer plugins install github.com/hashicorp/virtualbox

echo "[*] Place l'utilisateur test dans les bons groupes..."
usermod -aG sudo test
usermod -aG vboxusers test

echo "[!] reboot nécessaire"
sleep 5 
reboot