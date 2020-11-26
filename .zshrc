# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

clear2() { echo -e '\033[2J\033['$LINES';0H' }
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    :
else
    clear2
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE='nerdfont-complete' # http://nerdfonts.com/#cheat-sheet

DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
#plugins=(zsh-iterm-touchbar)

if [ `uname` = Linux -a $TERM = xterm ]; then
    export TERM="xterm-256color"
fi

source $ZSH/oh-my-zsh.sh

# pasting long lines is slow: (https://github.com/zsh-users/zsh-syntax-highlighting/issues/513)
export ZSH_HIGHLIGHT_MAXLENGTH=60

[ -f $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && . $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f $HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh ] && . $HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $HOME/.p10k.zsh ] || ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
[ -f "$HOME/.iterm2_shell_integration.zsh" ] && . "$HOME/.iterm2_shell_integration.zsh"
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
unsetopt share_history          # Dont share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.

zstyle ':completion:*' completer _complete _approximate

[ -f "$HOME/.zshrc.local" ] && . "$HOME/.zshrc.local"

type thefuck > /dev/null && eval $(thefuck --alias 2> /dev/null)

clear2w() { clear2; zle redisplay }
zle -N clear2w
bindkey '^L' clear2w
bindkey -M vicmd '^L' clear2w
bindkey -M viins '^L' clear2w
bindkey -v #viins
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[^?' backward-delete-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

zsh_update_stuff() {
    (cd $ZSH && git pull)
    (cd $ZSH/custom/themes/powerlevel10k && git pull)
    (cd $HOME/.zsh-syntax-highlighting && git pull)
    (cd $HOME/.zsh-autosuggestions && git pull)
}

[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
