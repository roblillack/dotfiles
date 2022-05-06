[ -f ~/.profile ] && . ~/.profile

# bash completion
for i in {,/opt/homebrew,/opt/local,/usr/local}/etc/bash_completion{,.d/*}; do
    if [ -f $i ]; then
        . $i
    fi
done

[ -f ~/.bashrc ] && . ~/.bashrc
