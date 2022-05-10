[ -f ~/.profile ] && . ~/.profile

export BASH_SILENCE_DEPRECATION_WARNING=1

# bash completion
for i in {,/opt/homebrew,/opt/local,/usr/local}/{etc/bash_completion{,.d/*},share/bash-completion/bash_completion}; do
    if [ -f $i ]; then
        . $i
    fi
done

[ -f ~/.bashrc ] && . ~/.bashrc
