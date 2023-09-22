GITHUB="https://github.com"

[[ -z "$RBENV_HOME" ]] && export RBENV_HOME="$HOME/.rbenv"

# export PATH
if [[ ! :$PATH: =~ :$RBENV_HOME/bin: ]]; then
	export PATH="$RBENV_HOME/bin:$PATH"
fi

if [[ ! :$PATH: =~ :${RBENV_ROOT:-$RBENV_HOME}/shims: ]]; then
	export PATH="${RBENV_ROOT:-$RBENV_HOME}/shims:$PATH"
fi

_zsh_rbenv_install() {
    echo "Installing rbenv..."
    git clone "${GITHUB}/rbenv/rbenv.git"            "${RBENV_HOME}"
    git clone "${GITHUB}/rkh/rbenv-update.git"       "${RBENV_HOME}/plugins/rbenv-update"
    git clone "${GITHUB}/rbenv/ruby-build.git"       "${RBENV_HOME}/plugins/ruby-build"
}

_zsh_rbenv_load() {
    eval "$(rbenv init - --no-rehash zsh | sed '/export PATH=/d')"
}

# install rbenv if it isnt already installed
if ! command -v rbenv &>/dev/null; then
    _zsh_rbenv_install
fi

# load rbenv if it is installed
if command -v rbenv &>/dev/null; then
    _zsh_rbenv_load
fi
