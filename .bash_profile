[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile





export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# begin bitcar
export BITCAR_WORKSPACE_DIR="$HOME/repos"
export BITCAR_EDITOR_CMD="vim"
source $HOME/.bitcar/cli.sh
source $HOME/.bitcar/completions.sh
# end bitcar

export PATH="$HOME/.cargo/bin:$PATH"

# opam configuration
test -r /Users/mogden/.opam/opam-init/init.sh && . /Users/mogden/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
