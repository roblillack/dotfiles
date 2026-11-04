# Bind a key both by name (kitty and other modern terminals) and as a
# "Rob key" (xterm via ~/.Xdefaults, iTerm2, Windows Terminal), which sends
# \e[rA;KEY~ for Alt+KEY and \e[rC;KEY~ for Ctrl+KEY.
# Usage: __rob_bind KEYNAME ROBKEY COMMAND, where ROBKEY is the part after
# "\e[r", e.g. "C;BS~".
function __rob_bind
    set -l key $argv[1]
    set -l rob $argv[2]
    set -l cmd $argv[3..]
    if test (string split . -- $version)[1] -ge 4
        bind $key $cmd
        # fish 4 only binds key names, and reads "\e[r" as a complete (unknown)
        # escape sequence that it drops. The rest of a Rob key, e.g. "C;BS~",
        # then arrives as typed characters, so bind those as a key sequence.
        bind (string join , -- (string split '' -- $rob)) $cmd
    else
        # fish 3 matches raw escape sequences
        bind \e\[r$rob $cmd
    end
end

function fish_user_key_bindings
    # Keep typing a capital A or C responsive: wait at most 50ms for the
    # rest of a Rob key (a terminal sends it all at once)
    set -g fish_sequence_key_delay_ms 50

    __rob_bind alt-backspace 'A;BS~' backward-kill-token
    __rob_bind alt-delete 'A;DEL~' kill-token
    __rob_bind alt-left 'A;LEFT~' prevd-or-backward-token
    __rob_bind alt-right 'A;RIGHT~' nextd-or-forward-token

    __rob_bind ctrl-backspace 'C;BS~' backward-kill-word
    __rob_bind ctrl-delete 'C;DEL~' kill-word
    __rob_bind ctrl-left 'C;LEFT~' backward-word
    __rob_bind ctrl-right 'C;RIGHT~' forward-word
end

function fish_prompt -d "Write out the prompt"
    set -l suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
        set suffix '#'
    end
    echo -n -s $USER '@' (prompt_hostname) ':' (prompt_pwd) (fish_vcs_prompt) $suffix ' '
end

function fish_title
    set -q argv[1]; or set argv fish
    # Looks like ~/d/fish: git log
    # or /e/apt: fish
    echo (fish_prompt_pwd_dir_length=1 prompt_pwd): $argv

end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_autosuggestion_enabled 0
    set -g fish_greeting ''

    set -g fish_complete_path $fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
    fish_config theme choose Tomorrow

    if which birthdays &>/dev/null
        birthdays
    end
end

if which hx &>/dev/null
    set -gx EDITOR hx
else if which vim &>/dev/null
    set -gx EDITOR vim
else
    set -gx EDITOR vi
end
set -gx VISUAL $EDITOR

if test -f /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
    fish_add_path /opt/homebrew/bin
end

# On NixOS, preserve system paths before adding user paths
if test -f /etc/NIXOS
    set -g --append fish_user_paths $PATH
end

fish_add_path ~/bin ~/{go,.cargo,.yarn,.local}/bin >/dev/null
