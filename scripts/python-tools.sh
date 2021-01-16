#!/bin/bash
echo "Installing Python..."
sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev
asdf plugin-add python
asdf install python latest
asdf global python $(asdf list python)
python --version