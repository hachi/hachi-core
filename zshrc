echo "Loading ~/.hachi/zshrc" >&2

source ~/.hachi/shell-common

PS1='%(!.%B%S.)%n@%M%b%s:%~%# '

bindkey "[3~" delete-char

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

HISTFILE=~/.zsh_history
SAVEHIST=1000
REPORTTIME=2

if [ "$TERM" = "screen" ]
then
    bindkey "" beginning-of-line
    bindkey "" delete-char-or-list
    bindkey "" end-of-line
    bindkey "[1~" beginning-of-line
    bindkey "[4~" end-of-line
fi
