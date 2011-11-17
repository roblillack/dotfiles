# bash-completion
for i in {,/opt/local,/usr/local}/etc/bash_completion; do
    if [ -f $i ]; then
        . $i
    fi
done

if [ -d ~/.bash_completion.d ]; then
   for i in ~/.bash_completion.d/*.sh; do
       source "$i"
   done
fi

[ -f ~/.profile ] && . ~/.profile
[ -f ~/.bashrc ] && . ~/.bashrc

#complete -fX '!*.rar' unrar
