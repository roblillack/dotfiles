set -o emacs

if [ -n "$KSH_VERSION" ]; then
    (( `id -u` == 0 )) && \
    PS1='\[\e[7m\]\h:\w#\[\e[0m\] ' || \
    PS1='\u@\h:\w% '
else
    HOSTNAME=`uname -n`
    USER=`id -un`

    (( `id -u` == 0 )) \
    && PS1='${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}# ' \
    || PS1='${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}> '
fi

[ -r ~/.shrc ] && . ~/.shrc

