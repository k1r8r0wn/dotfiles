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

# For Git stuff
ln -s ${DOTFILES_DIR}/.dotfiles/Git/.gitconfig ~/.gitconfig
ln -s ${DOTFILES_DIR}/.dotfiles/Git/.gitignore_global ~/.gitignore_global

# For Zsh
ln -s ${DOTFILES_DIR}/.dotfiles/.zshrc ~/.zshrc

# For Vim
ln -s ${DOTFILES_DIR}/.dotfiles/Vim/.vimrc ~/.vimrc
ln -s ${DOTFILES_DIR}/.dotfiles/Vim/.vim ~/.vim

# For Tmux
ln -s ${DOTFILES_DIR}/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ${DOTFILES_DIR}/.dotfiles/.tmux ~/.tmux

# HACK Uncomment this for iTerm2 < v3.5.0.beta
# ln -s ${DOTFILES_DIR}/iTerm2/auto_change_theme.py ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/

echo -e 'Done.'
