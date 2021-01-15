asdf plugin-add nodejs
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs 14.15.4
asdf install nodejs latest
asdf global nodejs 14.15.4
node -v