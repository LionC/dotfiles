#! /usr/bin/env zsh

brew upgrade
rustup update
nvim --headless "+Lazy! sync" +qa
omz update

# I hope I dont need this anymore, just dont install packages that need node anymore?
# brew uninstall --ignore-dependencies node
