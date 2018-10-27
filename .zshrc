# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_THEME="kardan"
[[ -f "$HOME/.oh-my-zsh/custom/themes/kardan-iterm2.zsh-theme" ]] && ZSH_THEME="kardan-iterm2"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context background_jobs dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=" \e[1D"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\e[00;44m \e[00;34m\e[0m "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=true
POWERLEVEL9K_HIDE_BRANCH_ICON=false

function get_host {
    echo '@'$HOST
}

DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
    docker
)

source $ZSH/oh-my-zsh.sh

[ -f "$HOME/.iterm2_shell_integration.zsh" ] && . "$HOME/.iterm2_shell_integration.zsh"
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

#zstyle ':completion:*' completer _approximate
zstyle ':completion:*' completer _complete _approximate

unsetopt share_history

[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"

type thefuck > /dev/null && eval $(thefuck --alias 2> /dev/null)

clear2() {
    echo -e '\033[2J\033['$LINES';0H'
}
clear2w() {
    clear2
    zle redisplay
}

zle -N clear2w
bindkey '^L' clear2w

clear2
