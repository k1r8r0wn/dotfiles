#!/bin/bash

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "Creating symlinks..."

# bash_profile
ln -s ${DOTFILES_DIR}/.bash_profile ~

# fish
ln -s ${DOTFILES_DIR}/config.fish ~/.config/fish

# zsh
ln -s ${DOTFILES_DIR}/.zshrc ~
ln -s ${DOTFILES_DIR}/.oh-my-zsh/themes/k1r8r0wn.zsh-theme ~/.oh-my-zsh/themes

# vim
ln -s ${DOTFILES_DIR}/.vimrc ~
ln -s ${DOTFILES_DIR}/.vim/ ~

echo -e "Done."
