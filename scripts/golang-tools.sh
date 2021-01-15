asdf plugin-add golang
asdf install golang latest
asdf global golang $(asdf list golang)
golang -v