##########################################
# Path to your oh-my-zsh installation
##########################################

ZSH=$HOME/.oh-my-zsh

##########################################
# Set name of the theme to load
##########################################

ZSH_THEME="k1r8r0wn"

##########################################
# Plugins
##########################################

plugins=(git osx ruby rails bundler brew)

##########################################
# Execute source
##########################################

source $ZSH/oh-my-zsh.sh

##########################################
# Aliases
##########################################

alias be="bundle exec"

alias dbreset="rails db:drop && rake db:create && rake db:migrate && rake db:seed"
alias dbmigrate="rails db:migrate"

alias d="docker"
alias dc="docker-compose"
alias da="docker attach"

alias icd='~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias elixir_tuts='~/Library/Mobile\ Documents/com~apple~CloudDocs/Tuts/Elixir'

##########################################
# Load .rbenv
##########################################

eval "$(rbenv init -)"
