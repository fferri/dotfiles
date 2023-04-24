export _HWM=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxExE
if [ -x "/usr/libexec/java_home" ]; then
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi
if [ -d "${HOMEBREW_PREFIX:-/usr/local}/opt/qt@5" ]; then
    export QT5_DIR="${HOMEBREW_PREFIX:-/usr/local}/opt/qt@5"
fi
if [ -n "$QT5_DIR" ]; then
    export CMAKE_PREFIX_PATH="${QT5_DIR}/lib/cmake"
fi
if [ -d "$HOME/Dev/Python/site-packages" ]; then
    export PYTHONPATH="$PYTHONPATH:$HOME/Dev/Python/site-packages"
fi
if command -v luarocks > /dev/null; then
    eval $(luarocks path --bin)
fi
if [ -f "$HOME/.profile.local" ]; then
    source "$HOME/.profile.local"
fi
export MAKEFLAGS="-j8"
export PYTHONSTARTUP=$HOME/.dotfiles/python_startup.py
