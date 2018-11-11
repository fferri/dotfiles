export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxExE
if [ -x "/usr/libexec/java_home" ]; then
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi
if [ -d "/usr/local/opt/qt" ]; then
    export QT5_DIR="/usr/local/opt/qt"
elif [ -d "$HOME/Dev/Qt/5.9.2/clang_64" ]; then
    export QT5_DIR="$HOME/Dev/Qt/5.9.2/clang_64"
fi
export CMAKE_PREFIX_PATH="${QT5_DIR}/lib/cmake"
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2
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
