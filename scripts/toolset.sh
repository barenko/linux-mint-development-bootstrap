echo "Installing the tool set..."

echo "   ZSH... no explain needed"
sudo apt install -y git curl wget zsh
chsh -s $(which zsh)

echo "    oh-my-zsh... because the life is fun too"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

echo "    oh-my-zsh plugins... let's put some steroids"
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
touch $HOME/.z
git clone https://github.com/johnhamelink/env-zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/env
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/kiurchv/asdf.plugin.zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/asdf
git clone https://github.com/voronkovich/gitignore.plugin.zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/gitignore

echo "    vim... old, fast, resource cheap and very versatile"
sudo apt install -y vim

echo "    terminator...because I too want the iTerm-like experience into linux too"
sudo add-apt-repository ppa:gnome-terminator
sudo apt update
sudo apt install -y terminator 

echo "    httpie...let's forget the curl/wget syntax bullshit"
sudo apt install -y httpie

echo "    ripgrep...infile finder with regex"
sudo apt install -y ripgrep 

echo "    fd-find...another good find because my memory is bad"
sudo apt install -y fd-find

echo "    watchexec... to run commands when a file changes, very versatile"
curl -sS https://webinstall.dev/watchexec/ | bash
sudo sh -c "wget -qO- https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip | funzip > /bin/exa && chmod +x /bin/exa"

echo "    htop... to manage processes with decency"