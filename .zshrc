export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="machellerogden"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $HOME/.zprofile


# begin bitcar
export BITCAR_WORKSPACE_DIR="/Users/mogden/repos"
export BITCAR_EDITOR_CMD="vim"
source $HOME/.bitcar/cli.sh
source $HOME/.bitcar/completions.sh
# end bitcar