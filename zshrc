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

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

[ -r ~/.shrc ] && . ~/.shrc
