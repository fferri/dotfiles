export PATH=$HOME/.bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete' # http://nerdfonts.com/#cheat-sheet
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode custom_context custom_background_jobs dir custom_vcs)
POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_VI_COMMAND_MODE_STRING="\ue7c5"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='005'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='236'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='022'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='white'
POWERLEVEL9K_DIR_PATH_SEPARATOR=" \ue0b1 "
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="black"
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=false
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=" \e[1D"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\e[00;44m \e[00;34m\e[0m "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_CUSTOM_CONTEXT='echo "$USER@$SHORT_HOST"'
POWERLEVEL9K_CUSTOM_CONTEXT_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_CONTEXT_FOREGROUND="blue"
POWERLEVEL9K_CUSTOM_BACKGROUND_JOBS='j=$(echo $(jobs|wc -l)); if [ $j -gt 0 ]; then echo "\uf110 $njobs"; fi'
POWERLEVEL9K_CUSTOM_BACKGROUND_JOBS_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_BACKGROUND_JOBS_FOREGROUND="black"
POWERLEVEL9K_DIR_BACKGROUND="#6d8bb3"
POWERLEVEL9K_DIR_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_VCS='if [ -d .git ]; then echo "\uf126 $(git rev-parse --abbrev-ref HEAD)"; fi'
POWERLEVEL9K_CUSTOM_VCS_BACKGROUND="gray"
POWERLEVEL9K_CUSTOM_VCS_FOREGROUND="green"

DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=()

source $ZSH/oh-my-zsh.sh

[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && . /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "$HOME/.iterm2_shell_integration.zsh" ] && . "$HOME/.iterm2_shell_integration.zsh"
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

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

clear2() { echo -e '\033[2J\033['$LINES';0H' }
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
clear2
