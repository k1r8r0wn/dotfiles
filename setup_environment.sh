#!/bin/bash

##########################################
# Create symlinks
##########################################

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e 'Creating symlinks...'

# bash_profile
ln -s ${DOTFILES_DIR}/Projects/self/.bash_profile ~

# fish
#ln -s ${DOTFILES_DIR}/Projects/self/config.fish ~/.config/fish

# zsh
ln -s ${DOTFILES_DIR}/Projects/self/.zshrc ~
# ln -s ${DOTFILES_DIR}/Projects/self/.oh-my-zsh/themes/k1r8r0wn.zsh-theme ~/.oh-my-zsh/themes

# vim
ln -s ${DOTFILES_DIR}/Projects/self/.vimrc ~
ln -s ${DOTFILES_DIR}/Projects/self/.vim/ ~

# HACK for iTerm2 < v3.5.0.beta
# ln -s ${DOTFILES_DIR}/iTerm2/auto_change_theme.py ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/

##########################################
# Install Homebrew
##########################################

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo -e 'Done.'
