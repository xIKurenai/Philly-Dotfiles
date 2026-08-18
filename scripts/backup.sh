#!/usr/bin/env bash

set -e

BACKUP_DIR="$HOME/.dotfiles-backup"

echo "======================================"
echo "💾 Philly Dotfiles Backup"
echo "======================================"
echo

mkdir -p "$BACKUP_DIR"

backup() {
    local target="$1"

    if [ -L "$target" ]; then
        echo "↪️ Überspringe Symlink: $target"
        return
    fi

    if [ -e "$target" ]; then
        local name
        name="$(basename "$target")"

        mv "$target" "$BACKUP_DIR/$name"
        echo "✅ Gesichert: $target"
    fi
}

backup "$HOME/.bashrc"

backup "$HOME/.config/fastfetch"
backup "$HOME/.config/fish"
backup "$HOME/.config/hypr"
backup "$HOME/.config/kde"
backup "$HOME/.config/kitty"
backup "$HOME/.config/starship.toml"
backup "$HOME/.config/waybar"

echo
echo "🎉 Backup abgeschlossen."
echo "📁 Sicherungen liegen in: $BACKUP_DIR"
