echo "Installing Rust..."
asdf plugin-add rust
asdf install rust latest
asdf global rust $(asdf list rust)
cargo --version

echo "   runiq... a resource cheap unique line tool"
cargo install runiq

echo "    bat... a really better way to 'cat' your files"
cargo install bat


asdf reshim rust