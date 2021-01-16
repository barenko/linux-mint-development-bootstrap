#!/bin/bash
echo "Installing snap..."

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install -y snapd

echo "    vscode... the best development text editor can't be forget"
sudo snap install code --classic

if [ "${LMDB_JAVA:-y}" == "y" ]; then
    echo "    idea... the best java IDE available, but it can drain your resources as like chrome does"
    sudo snap install intellij-idea-community --classic
    cp /var/lib/snapd/desktop/applications/intellij-idea-community_intellij-idea-community.desktop ~/.local/share/applications/
fi

