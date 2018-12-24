##########################################
# Greetings
##########################################

function fish_greeting
 echo 'Hello, k1r8r0wn!'
end

funcsave fish_greeting

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
# Aliases & custom functions
##########################################

alias icd='~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias elixir_tuts='~/Library/Mobile\ Documents/com~apple~CloudDocs/Tuts/Elixir'

alias weather='curl https://wttr.in/omsk'
alias oracul='bash ~/oracul.sh'

function cht
  curl https://cht.sh/$argv
end

##########################################
# Load .rbenv
##########################################

rbenv init - | source

##########################################
# Open files in VScode
##########################################

function vscode
  env VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $argv
end
