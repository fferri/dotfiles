export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxExE
export JAVA_HOME="$(/usr/libexec/java_home)"
export QT5_DIR="$HOME/Dev/Qt/5.9.2/clang_64"
export CMAKE_PREFIX_PATH="${QT5_DIR}/lib/cmake"
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2
export CXX="$HOME/.vim/bin/cc_args.py g++"
export PYTHONPATYH="$PYTHONPATYH:$HOME/Dev/Python/site-packages"
eval $(luarocks path --bin)
[ "$HOME/.profile.local ] && source "$HOME/.profile.local"
