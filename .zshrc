##########################################
# Settings
##########################################

# Homebrew stuff
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# PATH for rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# Fix falcon run https://github.com/socketry/falcon/issues/225
export PGGSSENCMODE="disable"

# For custom k9s themes
export XDG_CONFIG_HOME=$HOME/.config

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
    rbenv
    zsh-autosuggestions
    zsh-syntax-highlighting
    web-search
    kubectl
    vscode
    mix
    tmux
    golang
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
alias pro='cd ~/Projects'
alias self='cd ~/Projects/self'
alias os='cd ~/Projects/os'
alias dot='cd ~/Projects/self/dotfiles'
alias tuts='cd ~/Projects/tuts'

alias v='vim'
alias gks='git-quick-stats' # https://github.com/arzzen/git-quick-stats

# Gems
alias gml='gem query --local' # Get the list of installed gems in the system

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
alias re='rubocop \--auto-gen-config \--auto-gen-only-exclude \--exclude-limit=10000'

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

# Get the code impact via gir log by given author
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

##########################################
# Private stuff
##########################################

source $HOME/.zshrc-private
