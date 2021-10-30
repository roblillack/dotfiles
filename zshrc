HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=10000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

#PROMPT='%~ %(!.#.$) '
PROMPT='%~ %# '

bindkey -e
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

bindkey "\e[rC;BS~" backward-delete-word
bindkey "\e[rC;DEL~" delete-word
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

[ -r ~/.shrc ] && . ~/.shrc
