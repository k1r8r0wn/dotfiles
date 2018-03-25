##########################################
# Settings
##########################################

# Path to your oh-my-zsh installation
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="k1r8r0wn"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

##########################################
# Plugins
##########################################

plugins=(brew bundler docker docker-compose git git-flow heroku osx rails rbenv)

##########################################
# Execute source
##########################################

source $ZSH/oh-my-zsh.sh

##########################################
# Aliases
##########################################

alias icd='~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias elixir_tuts='~/Library/Mobile\ Documents/com~apple~CloudDocs/Tuts/Elixir'

alias weather='curl http://wttr.in/'

##########################################
# Load .rbenv
##########################################

eval "$(rbenv init -)"
