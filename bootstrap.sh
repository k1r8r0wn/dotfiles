#!/bin/bash

# Get the current dir (so run this script from anywhere)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Apple's Command Line Tools, which are prerequisites for Git & Homebrew
xcode-select --install

##########################################
# Install Homebrew
##########################################

/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)'
brew bundle --file ${DOTFILES_DIR}/.dotfiles/Brewfile

##########################################
# Install ohmyzsh
##########################################

sh -c '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'

##########################################
# Create symlinks
##########################################

echo -e 'Creating symlinks...'

# IRB
ln -s ${DOTFILES_DIR}/Git/.irbrc ~/.irbrc

# Git stuff
cp ${DOTFILES_DIR}/Git/.gitconfig-example ${DOTFILES_DIR}/Git/.gitconfig
ln -s ${DOTFILES_DIR}/Git/.gitconfig ~/.gitconfig
ln -s ${DOTFILES_DIR}/Git/.gitignore_global ~/.gitignore_global

# Zsh
ln -s ${DOTFILES_DIR}/.zshrc ~/.zshrc

# Vim
ln -s ${DOTFILES_DIR}/Vim/.vimrc ~/.vimrc
ln -s ${DOTFILES_DIR}/Vim/.vim ~/.vim

# Tmux
ln -s ${DOTFILES_DIR}/.tmux.conf ~/.tmux.conf
ln -s ${DOTFILES_DIR}/.tmux ~/.tmux

echo -e 'Done.'
