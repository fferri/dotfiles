export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxExE
[ -x "/usr/libexec/java_home" ] && export JAVA_HOME="$(/usr/libexec/java_home)"
export QT5_DIR="$HOME/Dev/Qt/5.9.2/clang_64"
[ -d "$QT5_DIR" ] || unset QT5_DIR
export CMAKE_PREFIX_PATH="${QT5_DIR}/lib/cmake"
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2
[ -x "$HOME/.vim/bin/cc_args.py" ] && export CXX="$HOME/.vim/bin/cc_args.py g++"
[ -d "$HOME/Dev/Python/site-packages" ] && export PYTHONPATYH="$PYTHONPATYH:$HOME/Dev/Python/site-packages"
command -v luarocks > /dev/null && eval $(luarocks path --bin)
[ -f "$HOME/.profile.local" ] && source "$HOME/.profile.local"
