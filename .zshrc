##########################################
# Settings
##########################################

# Homebrew stuff
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/Users/k1r8r0wn/.local/bin:$PATH"

# Path to your oh-my-zsh installation
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME='robbyrussell'

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE='true'

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION='true'

##########################################
# Plugins
##########################################

plugins=(
  brew
  tmux
  bundler
  docker
  docker-compose
  git
  git-flow
  macos
  rails
  rbenv
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  kubectl
  aws
)

##########################################
# Execute source
##########################################

source $ZSH/oh-my-zsh.sh

##########################################
# Aliases
##########################################

# System
alias t='type' # check for full command from alias

alias c='clear'

alias ll='ls -lh'
alias la='ls -lah'

alias ..='cd ../'
alias ...='cd ../../'
alias pro='cd ~/Projects'
alias self='cd ~/Projects/self'
alias os='cd ~/Projects/os'
alias dot='cd ~/Projects/self/dotfiles'

alias v='nvim'
alias nv='nvim'

alias gks='git-quick-stats' # https://github.com/arzzen/git-quick-stats

# RSpec
alias b='bundle'
alias cov='COVER=1 be rspec spec'

alias spch='be rspec --format=html > rspec_tests.html'
alias spcb='open rspec_tests.html'

# Rubocop
alias re='rubocop \--auto-gen-config \--auto-gen-only-exclude \--exclude-limit=10000'

# Dev logs
alias logs='tail -f log/development.log'

##########################################
# Functions
##########################################

function ber () {
  if [[ $1 > 0 ]]; then
    if [[ $2 > 0 ]]; then
      for i in {1..$2}; do be rspec $1; done;
    else
      be rspec $1
    fi
  else
    be rspec spec
  fi
}

function code () {
  VSCODE_CWD="$PWD" open -n -b 'com.microsoft.VSCode' --args $*
}

function weather () {
  if [[ $1 > 0 ]]; then
    curl 'https://wttr.in/$1'
  else
    curl 'https://wttr.in/saint_petersbourg'
  fi
}

function impact () {
  if [[ $1 > 0 ]]; then
    git log --author="$1" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
  else
    echo 'No author name specified'
  fi
}

##########################################
# Private stuff
##########################################

source $HOME/.zshrc-private
