#!/usr/bin/env bash
# Symlink configs from this repo into $HOME. The repo is the source of truth.
# Existing files/dirs at a target are moved to <target>.bak-<timestamp>.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
    local src="$DOTFILES/$1" dst="$2"
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "ok      $dst"
        return
    fi
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mv "$dst" "$dst.bak-$STAMP"
        echo "backup  $dst -> $dst.bak-$STAMP"
    fi
    ln -s "$src" "$dst"
    echo "link    $dst -> $src"
}

# Whole directories
link kitty "$CONFIG/kitty"
link tmux  "$CONFIG/tmux"

# fish: link files individually so machine-local state
# (fish_variables, local.fish, fish-generated conf.d files) stays out of the repo
link fish/config.fish "$CONFIG/fish/config.fish"
for f in "$DOTFILES"/fish/{conf.d,functions,completions}/*.fish; do
    [ -e "$f" ] || continue
    rel="${f#"$DOTFILES"/}"
    link "$rel" "$CONFIG/${rel}"
done
