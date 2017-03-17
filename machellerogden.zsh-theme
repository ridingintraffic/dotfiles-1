# vi stuff
bindkey -v
export KEYTIMEOUT=0
#MODE_INDICATOR="%F{magenta}<%f%F{yellow}<%f%F{magenta}<%f%{$reset_color%}"
#function vi_mode_prompt_info() {
#  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
#}

# git stuff
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%} '

# pulling it all together
#PROMPT='%{$(vi_mode_prompt_info)$fg[cyan]%}%1~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}$(git_prompt_info)%{$fg[cyan]%}⇒%{$reset_color%} '


