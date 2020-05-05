##########################################
# Settings
##########################################

# Path to your oh-my-zsh installation
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME='k1r8r0wn'

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
  osx
  rails
  rbenv
  zsh-autosuggestions
)

##########################################
# Execute source
##########################################

source $ZSH/oh-my-zsh.sh

##########################################
# Load .rbenv
##########################################

eval "$(rbenv init -)"

##########################################
# Open files in VScode
##########################################

function vscode () {
  VSCODE_CWD="$PWD" open -n -b 'com.microsoft.VSCode' --args $*
}

##########################################
# Other stuff
##########################################

function weather () {
  if [[ $1 > 0 ]]; then
    curl "https://wttr.in/$1"
  else
    curl 'https://wttr.in/saint_petersbourg'
  fi
}

alias oracul='bash ~/oracul.sh'
