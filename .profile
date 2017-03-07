# ENVIRONMENT

# vars
export JAVA_VERSION=1.7
export JAVA_HOME=`/usr/libexec/java_home -v $JAVA_VERSION`
export PATH="$HOME/bin:$HOME/.node/bin:/Users/macheller-ogden/repos/cars-scripts:/Users/macheller-ogden/Tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#export PATH="$HOME/bin:$HOME/.node/bin:$JAVA_HOME/bin/Users/macheller-ogden/repos/cars-scripts:/Users/macheller-ogden/Tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#export CLASSPATH="$JAVA_HOME/lib/tools.jar"
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

# auto-complete
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

# ALIASES

# functions
function FindProcess() {
   ps -A -o 'pid,args' | grep "$@" | grep -v grep
}
function KillProcess() {
   killall -9 "$@";
}
function ListAll() {
   ls -al "$@";
}
function UnlinkAll() {
   ls -al ./node_modules | grep '>' | awk '{print $9}' | xargs npm unlink;
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

function RealPath(){
    local given_path="$1"
    local link_path="$(readlink "$given_path")"
    if [ $? -eq 0 ] && [ -n "$link_path" ]; then
        RealPath "$link_path"
    else
        printf "%s" "$given_path"
        echo
    fi
}
function ReadMarkdown() {
    local file
    if [ "$1" = "-t" ]; then
        file="${2:-"README.md"}"
        pandoc "$file" | lynx -stdin
    else
        file="${1:-"README.md"}"
        open -a Marked\ 2.app "$file"
    fi
}

function Scratch() {
    vim `mktemp`
}

function MergeVerticalCoverage() {
    if [ ! -d "$(pwd)/coverage" ]; then
        mkdir "$(pwd)/coverage"
    fi
    jq -s '.[0] * .[1]' "$(pwd)/reports/coverage/server/coverage.json" "$(pwd)/reports/coverage/app/coverage-final.json" > "$(pwd)/coverage/coverage.json"
}

# utility
alias scratch=Scratch
alias pa=FindProcess
alias rp=RealPath
alias kp=KillProcess
alias ll=ListAll
alias lr=ListRecursively
alias h=GrepHistory
alias hl=GrepHistory
alias cl='clear'
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias FUCK='fuck'
alias dports=DockerPorts
alias hc='cat /dev/null > ~/.bash_history && history -c && clear'
alias ua=UnlinkAll
alias rmd=ReadMarkdown
alias vrc='vim ~/.vimrc'
alias mergecoverage=MergeVerticalCoverage
alias bim='bit -e'

# directories, branches, apps
alias dotfiles='cd ~/.dotfiles'
alias repos='cd ~/repos'
alias www='cd ~/repos/www'
alias mdot='cd ~/repos/mobile/profile_nav/mobiWebStatic/WebContent'
alias master='cd ~/repos/www;git stash -u;git checkout master'
alias dq01='cd ~/repos/www;git stash -u;git checkout qa-dq01'
alias dq02='cd ~/repos/www;git stash -u;git checkout qa-dq02'
alias sandbox='cd ~/repos/sandbox'
alias runsandbox='cd ~/repos/sandbox;./debug'
alias userprofile='cd ~/repos/user-profile'
alias runuserprofile='cd ~/repos/user-profile;./macProfile.sh'

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


# misc aliases
JCH() {
    export JAVA_HOME=`/usr/libexec/java_home -v $1`;
}
alias ddown='docker ps -q | xargs docker stop | xargs docker rm'
alias jch=JCH

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
   . $(brew --prefix)/etc/bash_completion
fi
if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
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

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

export GOPATH=$HOME/repos/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"

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
  if [ "$PWD" != "$OLDPWD" ]; then
    OLDPWD="$PWD";
    rw
  fi
  setLastCommandState;setGitPrompt
}

export PROMPT_COMMAND=RENAME_WHEN_PROMPT

bind "TAB:menu-complete"

# z - https://github.com/rupa/z
. /usr/local/etc/profile.d/z.sh
