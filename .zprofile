#export CARS_DOT_COM_DIR="/Users/macheller-ogden/Repos/cars-dot-com" # cars-dot-com-repo-tool
#source "$CARS_DOT_COM_DIR/scripts/profile" # cars-dot-com-repo-tool

# common shell profile (bash/zsh)
source "$HOME/.common_profile"

function ShToggle() {
    if [ -n "$ZSH_VERSION" ]; then
        exec bash -l
        # assume Zsh
    elif [ -n "$BASH_VERSION" ]; then
        exec 
       # assume Bash
    else
       # asume something else
    fi 
}
alias shtoggle=ShToggle
