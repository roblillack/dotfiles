# setting the path a bit like in tcsh
if [ -n "$BASH_VERSION" -o "$KSH_VERSION" ]; then
  path=
  for i in $HOME/bin{/`uname -s`-`uname -m`,}\
           {/opt,/opt/local,/sw,/usr/local,,/usr,/usr/X11R6}/{s,}bin
  do path="${path:+$path:}$i"; done
  export PATH=$path
fi

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ -f $HOME/.localerc ]; then
  . $HOME/.localerc
elif [ "x`uname -s`" = "xOpenBSD" ]; then
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

if [ -f "/Applications/Emacs.app/Contents/MacOS/Emacs" -a\
     -f "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient" ]; then
    EMACSCLIENT="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
    EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
elif [ -f "/opt/emacs/bin/emacs" ]; then
    EMACSCLIENT="/opt/emacs/bin/emacsclient"
    EMACS="/opt/emacs/bin/emacs"
else
    EMACSCLIENT="emacsclient"
    EMACS="emacs"
fi

if [ "x" != "x`which $EMACS 2>/dev/null`" -a\
     "x" != "x`which $EMACSCLIENT 2>/dev/null`" ]; then
    EDITOR="$EMACSCLIENT --tty --alternate-editor="; export EDITOR
    VISUAL=$EDITOR; export VISUAL

    alias e='$EDITOR'
    alias E='$EMACSCLIENT --no-wait --create-frame --alternate-editor='
else
    if [ `which vim 2>/dev/null` ]; then
        EDITOR=vim
    else
        EDITOR=vi
    fi
    export EDITOR
    VISUAL=$EDITOR; export VISUAL

    alias e=$EDITOR
    alias E=$EDITOR
fi

[ -r ~/.profile.local ] && . ~/.profile.local