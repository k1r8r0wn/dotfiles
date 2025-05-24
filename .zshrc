##########################################
# Settings
##########################################

# PATH for mise
eval "$(/opt/homebrew/bin/mise activate zsh)"

# NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# For custom k9s themes
export XDG_CONFIG_HOME=$HOME/.config

# Fix falcon server run
# https://github.com/socketry/falcon/issues/225
export PGGSSENCMODE="disable"

# Fix karafka-rdkafka installation
# https://github.com/karafka/karafka-rdkafka/issues/126
# export CPPFLAGS="-I/Library/Developer/CommandLineTools/SDKs/MacOSX15.0.sdk/usr/include/c++/v1/"

# Freeze all string literals globally (may cause some issues)
# export RUBYOPT=--enable-frozen-string-literal

# Path to your oh-my-zsh installation
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME='robbyrussell'

# The following line will make the vscode plugin to open the app
VSCODE=code

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
    macos
    history
    ruby
    rails
    rake
    zsh-autosuggestions
    zsh-syntax-highlighting
    kubectl
    vscode
    mix
)

##########################################
# Execute source
##########################################

source $ZSH/oh-my-zsh.sh

##########################################
# Aliases
##########################################

# System
alias t='type' # Check for full command from alias
alias wtf='which'

alias c='clear'

alias ll='ls -lh'
alias la='ls -lah'

alias ..='cd ../'
alias ...='cd ../../'

alias v='vim'
alias nm='nvim'

alias gks='git-quick-stats' # https://github.com/arzzen/git-quick-stats

# Gems
alias gml='gem query --local' # Get the list of installed gems in the system

# Bundler
alias bou='bundler oudated' # Show all of the outdated gems in the current bundle

# RSpec
alias b='bundle'
alias cov='be rspec spec -c'

alias spch='be rspec --format=html > rspec_tests.html'
alias spcb='open rspec_tests.html'

# Sequel
alias dbd='rails db:sequel:dump' # Dumps the database schema into 'db/structure.sql'

# GraphQL
alias gs='rails graphql:schema:json' # Dump the schema to JSON in ./schema.json

# Rubocop
alias cop='rubocop'
alias re='rubocop --auto-gen-config --auto-gen-only-exclude --exclude-limit=100000'

# Dev logs
alias logs='tail -f log/development.log'

# Security checks
alias bra='brakeman -q --no-pager'
alias bau='bundle-audit check --update'

##########################################
# Functions
##########################################

# Running specs

# ber
# ber -c
# ber spec_name -c
# ber spec_name -r 2
# ber spec_name -r 2 -c
function ber() {
    local spec_file='spec'
    local repeats=1
    local flag=''

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
        -c|--coverage)
            flag='-c'
            shift
            ;;
        -of|--only-failures)
            flag='--only-failures'
            shift
            ;;
        -r|--repeats)
            repeats="$2"
            shift 2
            ;;
        *)
            spec_file="$1"
            shift
            ;;
        esac
    done

    for ((i = 1; i <= repeats; i++)); do
        be rspec "$spec_file" $flag
    done
}

# Get the code impact via git log by given author
function impact () {
    if [[ $1 > 0 ]]; then
        git log --author="$1" --pretty=tformat: --numstat |
        awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
    else
        echo 'No author name specified.'
    fi
}

# Get processes running on specified port
function port () {
    if [[ $1 > 0 ]]; then
        lsof_output=$(lsof -i tcp:$1)
        if echo "$lsof_output" | grep -q 'LISTEN'; then
            echo "$lsof_output"
        else
            echo 'Nothing is running on the given port.'
        fi
    else
        echo 'Specify the port.'
    fi
}

# ##########################################
# # Docker stuff
# ##########################################

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Compose now can delegate build to bake for better performances
export COMPOSE_BAKE=true

##########################################
# Private stuff
##########################################

source $HOME/.zshrc-private
