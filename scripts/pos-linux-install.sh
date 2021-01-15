echo "Installing the base of the system..."

sudo apt update && sudo apt upgrade

echo "Installing git and zsh..."
sudo apt install -y git gitk curl wget zsh
chsh -s $(which zsh)

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
touch $HOME/.z
git clone https://github.com/johnhamelink/env-zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/env
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/kiurchv/asdf.plugin.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/asdf
git clone https://github.com/voronkovich/gitignore.plugin.zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/gitignore


echo "Installing essential tools..."
sudo add-apt-repository ppa:gnome-terminator
sudo apt update
sudo apt install -y terminator httpie bat ripgrep fd-find
curl -sS https://webinstall.dev/watchexec/ | bash
sudo sh -c "wget -qO- https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip | funzip > /bin/exa && chmod +x /bin/exa"

sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt -y install snapd
sudo snap install code --classic
#sudo snap install batcat

echo "Installing docker and kubernetes tools..."
sudo apt remove docker docker.io containerd runc
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
sudo mv ./kind /usr/bin
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

echo "Installing a good version manager..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
asdf update

echo "Installing the best linux VPN tool..."
sudo -s 
wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
echo "deb http://build.openvpn.net/debian/openvpn/release/2.5 $(lsb_release -cs) main" > /etc/apt/sources.list.d/openvpn-aptrepo.list
apt update && apt-get install openvpn
exit

echo "Removing junk..."
sudo apt purge -y nano libreoffice-core openjdk-11-jre openjdk-11-jre-headless libreoffice-common thunderbird