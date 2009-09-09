# bash-completion
for i in {,/opt/local,/usr/local}/etc/bash_completion; do
    if [ -f $i ]; then
        . $i
    fi
done

# setting the path a bit like in tcsh
path=
for i in $HOME/bin{/`uname -s`-`uname -m`,}\
         {/opt,/opt/local,/sw,/usr/local,,/usr,/usr/X11R6}/{s,}bin
do path="${path:+$path:}$i"; done
PATH=$path; export PATH

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ "x`uname -s`" = "xOpenBSD" ]; then
  LC_CTYPE=en_US.UTF-8; export LC_CTYPE
  unset LC_ALL
  unset LC_COLLATE
  unset LC_TIME
  unset LC_NUMERIC
  unset LC_MONETARY
  unset LC_MESSAGES
  unset LANG
else
  LANG=de_DE.UTF-8;	export LANG
  LC_CTYPE=de_DE.UTF-8;	export LC_CTYPE
  LC_COLLATE=de_DE.UTF-8; export LC_COLLATE
  LC_TIME=de_DE.UTF-8; export LC_TIME
  LC_NUMERIC=de_DE.UTF-8; export LC_NUMERIC
  LC_MONETARY=de_DE.UTF-8; export LC_MONETARY
  LC_MESSAGES=$LANG; export LC_MESSAGES
fi

COLORTERM=1; export COLORTERM
CLICOLOR=yeah; export CLICOLOR
TEXINPUTS=.:$HOME/Documents/projekte/tex:; export TEXINPUTS

PKG_CONFIG_PATH=/usr/lib/pkgconfig:/Library/Frameworks/Mono.framework/Libraries/pkgconfig:/opt/local/lib/pkgconfig; export PKG_CONFIG_PATH

BLOCKSIZE=K; export BLOCKSIZE
PAGER=less; export PAGER

if [ "x`uname -s`" = "xDarwin" ]; then
    EMACSCLIENT="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
    EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
elif [ -f "/opt/emacs/bin/emacs" ]; then
    EMACSCLIENT="/opt/emacs/bin/emacsclient"
    EMACS="/opt/emacs/bin/emacs"
else
    EMACSCLIENT="emacsclient"
    EMACS="emacs"
fi
EDITOR="$EMACSCLIENT --tty --alternate-editor="; export EDITOR
VISUAL=$EDITOR; export VISUAL

alias e='$EDITOR'
alias E='$EMACSCLIENT --no-wait --create-frame --alternate-editor='

