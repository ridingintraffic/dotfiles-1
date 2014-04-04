# ENVIRONMENT

# vars
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:/Users/macheller-ogden/Tools:/Users/macheller-ogden/.rbenv/shims:/Users/macheller-ogden/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# vim
set -o vi
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# git
source ~/.bash-git-prompt/gitprompt.sh


# ALIASES

# functions
function FindProcess() {
    ps -A -o 'pid,args' | grep "$@" | grep -v grep
}
function KillProcess() {
    killall -9 "$@";
}
function ListToLess() {
    ls -a "$@" | less;
}
function ListDetailToLess() {
    ls -al "$@" | less;
}
function GrepHistory() {
    history | grep "$@";
}
function GrepHistoryToLess() {
    history | grep "$@" | less;
}

# utility
alias pa=FindProcess
alias kp=KillProcess
alias la=ListToLess
alias ll=ListDetailToLess
alias h=GrepHistory
alias hl=GrepHistory

# directories, branches, apps
alias repos='cd ~/Repos'
alias sandbox='cd ~/Repos/sandbox'
alias runsandbox='cd ~/Repos/sandbox;./debug'

# git aliases
alias g='git'
__git_complete g _git
alias gch='git-checkout'
__git_complete gch _git_checkout
alias gco='git-commit'
__git_complete gco _git_commit
alias gdi='git-diff'
__git_complete gdi _git_diff
alias gst='git-status'
__git_complete gst _git_status
alias glg='git-lg'
alias glf='git-lf'
alias gld='git-ld'
alias gbr='git-branch'
__git_complete gbr _git_branch
alias gpull='git-pull'
__git_complete gpull _git_pull
alias gpush='git-push'
__git_complete gpush _git_push

# github cli
eval "$(gh alias -s)"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
