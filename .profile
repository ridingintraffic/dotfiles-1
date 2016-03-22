# ENVIRONMENT

# vars
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export PATH="$HOME/bin:$HOME/.node/bin:$JAVA_HOME/bin:/Users/macheller-ogden/Repos/cars-scripts:/Users/macheller-ogden/Tools:/Users/macheller-ogden/.rbenv/shims:/Users/macheller-ogden/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export CLASSPATH="$JAVA_HOME/lib/tools.jar"
export HOST_DEV=cj8mcl121
export HOST_FT=cj7mcl121
export HOST_IT_MGMT=cj6mcl101
export HOST_IT_DELIVERY_1=cj6mcl121
export HOST_IT_DELIVERY_2=cj6mcl122
export V8PROFILER=/Users/macheller-ogden/.node/lib/node_modules/v8-profiler

# display variable for JumpStart
export DISPLAY=:0

# vim
set -o vi
export EDITOR='vim'

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
function ListRecursively() {
    ls -R "$@";
}
function GrepHistory() {
    history | grep "$@";
}
function GrepHistoryToLess() {
    history | grep "$@" | less;
}
function DockerPorts(){
    docker inspect --format='{{range $p, $conf := .NetworkSettings.Ports}} {{(index $conf 0).HostPort}} {{end}}' $(docker ps -q) 2> /dev/null
}

# utility
alias pa=FindProcess
alias kp=KillProcess
alias la=ListToLess
alias ll=ListDetailToLess
alias lr=ListRecursively
alias h=GrepHistory
alias hl=GrepHistory
alias cl='clear'
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias FUCK='fuck'
alias dports=DockerPorts
alias hc='history -c && clear'

# directories, branches, apps
alias dotfiles='cd ~/.dotfiles'
alias repos='cd ~/Repos'
alias www='cd ~/Repos/www'
alias mdot='cd ~/Repos/mobile/profile_nav/mobiWebStatic/WebContent'
alias master='cd ~/Repos/www;git stash -u;git checkout master'
alias dq01='cd ~/Repos/www;git stash -u;git checkout qa-dq01'
alias dq02='cd ~/Repos/www;git stash -u;git checkout qa-dq02'
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
alias groot='git rev-parse && cd "$(git rev-parse --show-cdup)"'

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
    __git_complete 'git freebase' _git_rebase
    # tmuxinator
    . $HOME/.tmuxinator.bash
fi


# pm2 completion
# Installation: pm2 completion >> ~/.profile

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export GOPATH=$HOME/Repos/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/macheller-ogden/.docker/machine/machines/cars"
export DOCKER_MACHINE_NAME="cars"

export ROKU_DEV_TARGET=172.17.244.254
export DEVPASSWORD=true
