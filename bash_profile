# bash-completion
for i in {,/opt/local,/usr/local}/etc/bash_completion; do
    if [ -f $i ]; then
        . $i
    fi
done

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.bashrc ] && . ~/.bashrc

#complete -fX '!*.rar' unrar
