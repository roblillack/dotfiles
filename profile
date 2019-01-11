# bash-completion
for i in {,/opt/local,/usr/local}/etc/bash_completion; do
    if [ -f $i ]; then
        . $i
    fi
done

# setting the path a bit like in tcsh
if [ -n "$BASH_VERSION" -o "$KSH_VERSION" ]; then
  path=
  for i in $HOME/bin{/`uname -s`-`uname -m`,}\
           {/snap,/opt,/opt/local,/sw,/usr/local,/Developer/usr,,/usr,/usr/X11R6}/{s,}bin
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
fi

COLORTERM=1; export COLORTERM
CLICOLOR=yeah; export CLICOLOR
TEXINPUTS=.:$HOME/Documents/projekte/tex:; export TEXINPUTS

#PKG_CONFIG_PATH=/usr/lib/pkgconfig:/Library/Frameworks/Mono.framework/Libraries/pkgconfig:/opt/local/lib/pkgconfig; export PKG_CONFIG_PATH

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
    alias E='$EMACSCLIENT --no-wait --create-frame --alternate-editor='
fi

if [ `which vim 2>/dev/null` ]; then
    EDITOR=vim
else
    EDITOR=vi
fi
export EDITOR
VISUAL=$EDITOR; export VISUAL

[ -r ~/.profile.local ] && . ~/.profile.local
