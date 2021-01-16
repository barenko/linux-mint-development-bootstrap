echo "Installing Nodejs..."
asdf plugin-add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

echo "    LTS..."
asdf install nodejs 14.15.4
asdf global nodejs 14.15.4

echo "    Lastest..."
asdf install nodejs latest

node -v