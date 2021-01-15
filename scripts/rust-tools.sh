asdf plugin-add rust
asdf install rust latest
asdf global rust $(asdf list rust)
cargo --version

cargo install runiq