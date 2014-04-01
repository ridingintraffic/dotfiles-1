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
alias dotfiles='cd ~/.dotfiles'
alias repos='cd ~/Repos'
alias www='cd ~/Repos/www'
alias mdot='cd ~/Repos/mobiWebStatic/WebContent'
alias master='cd ~/Repos/www;git stash;git checkout master'
alias dq01='cd ~/Repos/www;git stash;git checkout qa-dq01'
alias dq02='cd ~/Repos/www;git stash;git checkout qa-dq02'
alias sandbox='cd ~/Repos/sandbox'
alias runsandbox='cd ~/Repos/sandbox;./debug'
alias userprofile='cd ~/Repos/user-profile'
alias runuserprofile='cd ~/Repos/user-profile;./macProfile.sh'

# git aliases
alias g='git'
alias gch='git checkout'
alias gco='git commit'
alias gadd='git add'
alias grm='git rm'
alias gmv='git mv'
alias gbr='git branch'
alias gmerge='git merge'
alias grebase='git rebase'
alias gri='git rebase --interactive'
alias gpull='git pull'
alias gpush='git push'
alias gdiff='git diff'
alias gst='git status -s'
alias glg='git lg'
alias glf='git lf'
alias gld='git ld'

# github cli
eval "$(gh alias -s)"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
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
    # tmuxinator
    . $HOME/.tmuxinator.bash
fi
