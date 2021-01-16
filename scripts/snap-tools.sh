echo "Installing snap..."

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt -y install snapd

echo "    vscode... the best development text editor can't be forget"
sudo snap install code --classic

