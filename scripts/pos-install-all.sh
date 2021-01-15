echo "Configure your favorite editor..."
sudo update-alternatives --config editor

echo "Creating files and configurations..."
mkdir ~/projects
cd ~/projects
git clone git@github.com:barenko/linux-mint-development-bootstrap.git

BASEDIR=$(dirname "$0")
cp $BASEDIR/config/.config/htop/htoprc $HOME/.config/htop/htoprc
cp $BASEDIR/config/.config/terminator/config $HOME/.config/terminator/config

echo "Clearing unusued files..."

sudo apt-get clean
sudo apt-get autoremove

echo "We done here!"

read -p "Press any key to reboot"
sudo reboot -r now