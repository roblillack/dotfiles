function fish_user_key_bindings
    bind \e\[rA\;BS~ backward-kill-token
    bind \e\[rA\;DEL~ kill-token
    bind \e\[rA\;LEFT~ prevd-or-backward-token
    bind \e\[rA\;RIGHT~ nextd-or-forward-token

    bind \e\[rC\;BS~ backward-kill-word
    bind \e\[rC\;DEL~ kill-word
    bind \e\[rC\;LEFT~ backward-word
    bind \e\[rC\;RIGHT~ forward-word
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
