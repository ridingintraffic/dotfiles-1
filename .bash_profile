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
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/repos/github.com/machellerogden/g4b:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
