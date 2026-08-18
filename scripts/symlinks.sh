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

link "$DOTFILES/config/fastfetch" "$HOME/.config/fastfetch"
link "$DOTFILES/config/fish" "$HOME/.config/fish"
link "$DOTFILES/config/hypr" "$HOME/.config/hypr"
link "$DOTFILES/config/kde/kdeglobals" "$HOME/.config/kdeglobals"
link "$DOTFILES/config/kde/kwinrc" "$HOME/.config/kwinrc"
link "$DOTFILES/config/kde/plasmashellrc" "$HOME/.config/plasmashellrc"
link "$DOTFILES/config/kitty" "$HOME/.config/kitty"
link "$DOTFILES/config/starship.toml" "$HOME/.config/starship.toml"
link "$DOTFILES/config/waybar" "$HOME/.config/waybar"

echo
echo "🎉 Alle Symlinks wurden erstellt."
