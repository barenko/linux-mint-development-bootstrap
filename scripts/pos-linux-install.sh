#!/bin/bash
echo "Upgrading the base of the system... you do not want left behind"

sudo apt update && sudo apt upgrade -y


echo "Installing basic tools..."

echo "    codecs..."
sudo apt install -y mint-meta-codecs

echo "    tlp... a power management tool that works better than the default option"
sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw
sudo tlp start

echo "    git... the base tool for any kind of programmer"
sudo apt install -y git gitk

echo "    asdf... a good and generic version manager"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
PATH="$PATH:~/.asdf/bin/:~/.asdf/shims/"
asdf update

echo "    openvpn... the more useful vpn tool available in linux"
sudo su -c 'wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add - ; echo "deb http://build.openvpn.net/debian/openvpn/release/2.5 $(lsb_release -cs) main" > /etc/apt/sources.list.d/openvpn-aptrepo.list ; apt update && apt-get install openvpn'

