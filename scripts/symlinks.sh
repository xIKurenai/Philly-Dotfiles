#!/usr/bin/env bash

set -e

DOTFILES="$HOME/philly-dotfiles"

echo "======================================"
echo "🔗 Erstelle Symlinks"
echo "======================================"
echo

mkdir -p "$HOME/.config"

link() {
    local source="$1"
    local target="$2"

    rm -rf "$target"
    ln -s "$source" "$target"

    echo "✅ $(basename "$target")"
}

link "$DOTFILES/.bashrc" "$HOME/.bashrc"
link "$DOTFILES/.config/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES/.config/kitty" "$HOME/.config/kitty"
link "$DOTFILES/.config/fastfetch" "$HOME/.config/fastfetch"

echo
echo "🎉 Alle Symlinks wurden erstellt."
