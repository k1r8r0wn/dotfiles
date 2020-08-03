#!/bin/bash

##########################################
# Create symlinks
##########################################

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e 'Creating symlinks...'

# bash_profile
ln -s ${DOTFILES_DIR}/.bash_profile ~

# fish
#ln -s ${DOTFILES_DIR}/config.fish ~/.config/fish

# zsh
ln -s ${DOTFILES_DIR}/.zshrc ~
# ln -s ${DOTFILES_DIR}/.oh-my-zsh/themes/k1r8r0wn.zsh-theme ~/.oh-my-zsh/themes

# vim
ln -s ${DOTFILES_DIR}/.vimrc ~
ln -s ${DOTFILES_DIR}/.vim/ ~

##########################################
# Add projects folder
##########################################

echo -e 'Creating projects folder...'

mkdir ~/Projects

##########################################
# Install Homebrew
##########################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo -e 'Done.'
