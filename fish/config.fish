if status is-interactive
    # Commands to run in interactive sessions can go here
    set -x TELEPORT_LOGIN "marktanui"
    set -x ANSIBLE_REMOTE_USER "marktanui"
end

# Machine-specific settings that don't belong in the repo
test -f ~/.config/fish/local.fish; and source ~/.config/fish/local.fish
