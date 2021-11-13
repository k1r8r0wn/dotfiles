##########################################
# Settings
##########################################

export PATH="/usr/local/sbin:$PATH"

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
  bundler
  docker
  docker-compose
  git
  git-flow
  heroku
  macos
  rails
  rbenv
  zsh-autosuggestions
  kubectl
  aws
)

##########################################
# Execute source
##########################################

source $ZSH/oh-my-zsh.sh

##########################################
# Development stuff
##########################################

# RSpec
alias cov='COVER=1 be rspec spec'
alias spch='be rspec --format=html > rspec_tests.html'
alias spcb='open rspec_tests.html'

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

##########################################
# Open files in VScode
##########################################

function code () {
  VSCODE_CWD="$PWD" open -n -b 'com.microsoft.VSCode' --args $*
}

##########################################
# Other stuff
##########################################

alias oracul="bash ~/oracul.sh"
alias k="kubectl"
alias gks="git-quick-stats"

function weather () {
  if [[ $1 > 0 ]]; then
    curl "https://wttr.in/$1"
  else
    curl 'https://wttr.in/saint_petersbourg'
  fi
}

# https://github.com/arzzen/git-quick-stats
function impact () {
  if [[ $1 > 0 ]]; then
    git log --author="$1" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
  else
    echo "No author name specified"
  fi
}
