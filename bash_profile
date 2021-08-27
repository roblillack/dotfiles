[ -f ~/.profile ] && . ~/.profile

# bash-completion
for i in {,/opt/homebrew,/opt/local,/usr/local}/etc/bash_completion; do
    if [ -f $i ]; then
        . $i
    fi
done

for d in {/usr/local/etc/,~/.}bash_completion.d; do
   if [ -d "$d" ]; then
      for i in "$d"/*.sh "$d"/*.bash; do
          source "$i"
      done
   fi
done

[ -f ~/.bashrc ] && . ~/.bashrc
