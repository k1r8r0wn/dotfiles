##########################################
# Vars
##########################################

PATH=/usr/local/bin:$PATH
CLICOLOR=1

NONE="\[\033[0m\]"    # unsets color to term's fg color

K="\[\033[0;30m\]"    # black
R="\[\033[0;31m\]"    # red
G="\[\033[0;32m\]"    # green
Y="\[\033[0;33m\]"    # yellow
B="\[\033[0;34m\]"    # blue
M="\[\033[0;35m\]"    # magenta
C="\[\033[0;36m\]"    # cyan
W="\[\033[0;37m\]"    # white

##########################################
# Functions
##########################################

function parse_git_deleted {
  [[ $(git status 2> /dev/null | grep deleted:) != "" ]] && echo "-"
}
function parse_git_added {
  [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]] && echo '+'
}
function parse_git_modified {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo "*"
}
function parse_git_dirty {
  echo "$(parse_git_added)$(parse_git_modified)$(parse_git_deleted)"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

function ruby_ver {
  rbenv version | grep -o '^\S*'
}

function color_git {
  if [[ $(parse_git_branch) != "" ]]
  then
    echo "$W on $M$(parse_git_branch)$NONE"
  fi
}

function prompt {
  if [[ $? = "0" ]]; then RET=$G; else RET=$R; fi;
  PS1="$NONE\n$RET\u$W using $Y$(ruby_ver)$W in $B\w$(color_git)$Y\n$ $NONE"
}

##########################################
# Prompt
#############i#############################

PS1='\u:\w\$ '
#PROMPT_COMMAND=prompt

##########################################
# Aliases
##########################################

alias be="bundle exec"

alias dbreset="rails db:drop && rake db:create && rake db:migrate && rake db:seed"
alias dbmigrate="rails db:migrate"

alias d="docker"
alias dc="docker-compose"
alias da="docker attach"

##########################################
# Load .rbenv
##########################################

eval "$(rbenv init -)"
