export PS1=" \[\033[0;36m\]\u@\h \w\n\$ \[\e[00m\]"
export PS2="\[\033[0;36m\]> \[\e[00m\]"
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#bind '"\e\e[D": backward-word'
#bind '"\e\e[C": forward-word'
#bind 'TAB:menu-complete'
HISTCONTROL=ignoredups:erasedups
HISTSIZE=1000
HISTFILESIZE=100000
shopt -s histappend
[ -n "$ITERM_SESSION_ID" ] && export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
[ -f `brew --prefix`/etc/bash_completion ] && . `brew --prefix`/etc/bash_completion
[ -f "$HOME/.iterm2_shell_integration.bash" ] && source "$HOME/.iterm2_shell_integration.bash"
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"
