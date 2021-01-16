#!/bin/bash
echo "Removing bloatware..."

echo "    java openjdk... Thanks, but I prever manage the java myself"
sudo apt purge -y openjdk-8-jre openjdk-8-jre-headless openjdk-11-jre openjdk-11-jre-headless

echo "    libreoffice... because is resource expensive, ugly and I never liked it"
sudo apt purge -y libreoffice-core libreoffice-common

echo "    thunderbird... because no one with sense uses a client email anymore"
sudo apt purge -y thunderbird

echo "    nano... the weirdest text editor I've ever seen"
sudo apt purge -y nano

echo "    pix... I'm not a frontend (and photogenic neither) guy"
sudo apt remove -y pix pix-data