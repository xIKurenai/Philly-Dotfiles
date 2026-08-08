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

    if [ -e "$target" ] || [ -L "$target" ]; then
        local name
        name="$(basename "$target")"

        mv "$target" "$BACKUP_DIR/$name"
        echo "✅ Gesichert: $target"
    fi
}

backup "$HOME/.bashrc"
backup "$HOME/.config/starship.toml"
backup "$HOME/.config/kitty"
backup "$HOME/.config/fastfetch"

echo
echo "🎉 Backup abgeschlossen."
echo "📁 Sicherungen liegen in: $BACKUP_DIR"
