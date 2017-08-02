# common shell profile (bash/zsh)
source "$HOME/.common_profile"

# display variable for JumpStart
export DISPLAY=:0

# git
source ~/.bash-git-prompt/gitprompt.sh

# auto-complete
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "TAB:menu-complete"

# kill all history
function KillHistory() {
    cat /dev/null > ~/.bash_history && history -c && exit
}
alias killhistory=KillHistory

# super cd
alias scd='cd'
_scd_completion() {
    mapfile -t COMPREPLY < <(ls -d */ | grep "${COMP_WORDS[COMP_CWORD]}")
}
complete -F _scd_completion scd

# github cli
eval "$(gh alias -s)"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
   source "$(brew --prefix)/etc/bash_completion"
fi

if [ -f "~/.git-completion.bash" ]; then
   source "~/.git-completion.bash"
   # git completion for aliases
   __git_complete g _git
   __git_complete gch _git_checkout
   __git_complete gco _git_commit
   __git_complete gadd _git_add
   __git_complete grm _git_rm
   __git_complete gmv _git_mv
   __git_complete gdi _git_diff
   __git_complete gst _git_status
   __git_complete gbr _git_branch
   __git_complete gmerge _git_merge
   __git_complete grebase _git_rebase
   __git_complete gri _git_rebase
   __git_complete gpull _git_pull
   __git_complete gpush _git_push
   __git_complete gdiff _git_diff
   __git_complete gst _git_status
   __git_complete glg _git_log
   __git_complete glf _git_log
   __git_complete gld _git_log
   __git_complete 'git freebase' _git_rebase
fi

#export CARS_DOT_COM_DIR="/Users/macheller-ogden/repos/cars-dot-com" # cars-dot-com-repo-tool
#source "$CARS_DOT_COM_DIR/scripts/profile" # cars-dot-com-repo-tool

rw() {
    if [ -n "$TMUX" ]; then
        tmux setw -q window-status-format "#I:${PWD##/*/}#F"
        tmux setw -q window-status-current-format "#I:${PWD##/*/}#F"
    fi
}
bind '"\e[25~":"rw\n"'

RENAME_WHEN_PROMPT() {
  setLastCommandState;setGitPrompt
  rw
}

export PROMPT_COMMAND=RENAME_WHEN_PROMPT

# z - https://github.com/rupa/z
source /usr/local/etc/profile.d/z.sh
