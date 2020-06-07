##########################################
# Greetings
##########################################

function fish_greeting
 echo 'Hello, k1r8r0wn!'
end
funcsave fish_greeting

##########################################
# Load .rbenv
##########################################

rbenv init - | source

##########################################
# Set fish_user_paths
##########################################

set -g fish_user_paths '/usr/local/sbin' $fish_user_paths

##########################################
# Fish git prompt
##########################################

set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

##########################################
# Git stuff
##########################################

alias g='git'
alias gcln='git clone'
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gd='git diff'

function gdv
  git diff -w $argv | view -
end

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend't
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcm='git checkout master'
alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias gpoat='git push origin --all; and git push origin --tags'
alias gmt='git mergetool --no-prompt'

alias gg='git gui citool'
alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository or submodule
alias grt='cd (git rev-parse --show-toplevel; or echo ".")'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

# These aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
alias ggpur='git pull --rebase origin (current_branch)'
alias ggpush='git push origin (current_branch)'
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'

# Pretty log messages
function _git_log_prettily
  if ! [ -z $1 ]; then
    git log --pretty=$1
  end
end

alias glp='_git_log_prettily'

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress
  if git log -n 1 | grep -q -c wip; then
    echo "WIP!!"
  end
end

# These alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'

##########################################
# Development stuff
##########################################

alias be="bundle exec"

alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

alias RED='RAILS_ENV=development'
alias REP='RAILS_ENV=production'
alias RET='RAILS_ENV=test'

alias rc='rails console'
alias rcs='rails console --sandbox'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rgen='rails generate'
alias rgm='rails generate migration'
alias rp='rails plugin'
alias ru='rails runner'
alias rs='rails server'
alias rsd='rails server --debugger'
alias rsp='rails server --port'

alias rdm='rails db:migrate'
alias rdms='rails db:migrate:status'
alias rdr='rails db:rollback'
alias rdc='rails db:create'
alias rds='rails db:seed'
alias rdd='rails db:drop'
alias rdrs='rails db:reset'
alias rdtc='rails db:test:clone'
alias rdtp='rails db:test:prepare'
alias rdmtc='rails db:migrate db:test:clone'
alias rddcm='rails db:drop db:create db:migrate'
alias rdsl='rails db:schema:load'
alias rlc='rails log:clear'
alias rn='rails notes'
alias rr='rails routes'
alias rrg='rails routes | grep'
alias rt='rails test'
alias rmd='rails middleware'
alias rsts='rails stats'

# RSpec
alias cov='env COVER=1 be rspec spec'
alias spch='be rspec --format=html > rspec_tests.html'
alias spcb='open rspec_tests.html'

function ber
  if count $argv > /dev/null
    if count $argv[2] > /dev/null
      for x in (seq $arg[2]); be rspec $argv[1]; end;
    else
      be rspec $argv[1]
    end
  else
    be rspec spec
  end
end

##########################################
# Open files in VScode
##########################################

function vscode
  env VSCODE_CWD="$PWD" open -n -b 'com.microsoft.VSCode' --args $argv
end

##########################################
# Other stuff
##########################################

function weather
  if count $argv > /dev/null
    curl "https://wttr.in/$argv"
  else
    curl 'https://wttr.in/saint_petersbourg'
  end
end

alias oracul='bash ~/oracul.sh'
