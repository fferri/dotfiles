# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="robbyrussell"
ZSH_THEME="kardan"
[[ -f "$HOME/.oh-my-zsh/custom/themes/kardan-iterm2.zsh-theme" ]] && ZSH_THEME="kardan-iterm2"

function get_host {
    echo '@'$HOST
}

DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
    docker
)

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs background_jobs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=" \e[1D"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "

source $ZSH/oh-my-zsh.sh

[ -f "$HOME/.iterm2_shell_integration.zsh" ] && . "$HOME/.iterm2_shell_integration.zsh"
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

zstyle ':completion:*' completer _approximate

[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"

echo -e '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
