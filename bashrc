# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

HISTFILE=~/.history
HISTSIZE=5000

HOSTFILE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize histappend hostcomplete

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

#PS1='\[\033[1m\]\u\[\033[00m\]@\[\033[01m\]\h\[\033[00m\]:\[\033[04m\]\w\[\033[00m\]% '
if [ $UID -eq 0 ]; then
  PS1='\[\e[G\e[7m\]\h:\w#\[\e[0m\] '
elif type __git_ps1 &>/dev/null; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  PS1='\[\e[G\]\u@\h:\w$(__git_ps1 " (%s)")% '
else
  PS1='\[\e[G\]\u@\h:\w% '
fi


shopt -s globstar 2>/dev/null

# hi ubuntu!
unset command_not_found_handle

[ -f ~/.shrc ] && . ~/.shrc
