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
alias gch='git checkout'
alias gco='git commit'
alias gca='git commit -a'
alias gdi='git diff'

# github cli
eval "$(gh alias -s)"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
