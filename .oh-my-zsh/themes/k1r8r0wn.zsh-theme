##########################################
# Color vars
##########################################

eval gray='$FG[240]'
eval green='$FG[002]'
eval red='$FG[009]'
eval blue='$FG[075]'

##########################################
# Primary prompt
##########################################

PROMPT='$gray--------------------------------------------------------------------------------%{$reset_color%}
$green%~\
$(git_prompt_info) \
$red%(!.#.»)%{$reset_color%} '

##########################################
# Right prompt
##########################################

RPROMPT='%(?.%{$gray%}.%{$gray%})%*%{$reset_color%}'

##########################################
# Git settings
##########################################

ZSH_THEME_GIT_PROMPT_PREFIX="$blue("
ZSH_THEME_GIT_PROMPT_SUFFIX="$blue)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$green%}?"
ZSH_THEME_GIT_PROMPT_DIRTY="$red*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
