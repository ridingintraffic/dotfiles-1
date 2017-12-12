[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile





export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# begin bitcar
export BITCAR_WORKSPACE_DIR="/Users/mogden/repos"
export BITCAR_EDITOR_CMD="vim"
source $HOME/.bitcar/cli.sh
source $HOME/.bitcar/completions.sh
# end bitcar