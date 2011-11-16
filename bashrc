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
[ $UID -eq 0 ] && PS1='\[\e[7m\]\h:\w#\[\e[0m\] ' || PS1='\u@\h:\w% '


shopt -s globstar 2>/dev/null

# hi ubuntu!
unset command_not_found_handle

[ -f ~/.shrc ] && . ~/.shrc
