#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "======================================"
echo "🚀 Philly Dotfiles – CachyOS Installer"
echo "======================================"
echo

if ! command -v pacman >/dev/null 2>&1; then
    echo "❌ pacman wurde nicht gefunden."
    echo "Dieses Skript ist für CachyOS/Arch Linux gedacht."
    exit 1
fi

echo "📦 Installiere native Pakete..."
if [[ -f packages/pacman.txt ]]; then
    mapfile -t packages < <(grep -vE '^[[:space:]]*(#|$)' packages/pacman.txt)

    if ((${#packages[@]})); then
        sudo pacman -S --needed "${packages[@]}"
    fi
else
    echo "⚠️ packages/pacman.txt nicht gefunden."
fi

echo
echo "📦 Installiere Flatpaks..."
if command -v flatpak >/dev/null 2>&1 && [[ -f packages/flatpak.txt ]]; then
    while IFS= read -r app; do
        [[ -z "$app" || "$app" =~ ^[[:space:]]*# ]] && continue
        flatpak install -y flathub "$app"
    done < packages/flatpak.txt
else
    echo "⚠️ Flatpak oder packages/flatpak.txt nicht gefunden."
fi

echo
echo "💾 Sichere vorhandene Konfigurationen..."
./scripts/backup.sh

echo
echo "🔗 Erstelle Symlinks..."
./scripts/symlinks.sh

echo
echo "💾 Aktualisiere System-Inventur..."
if [[ -x ./scripts/backup-system.sh ]]; then
    ./scripts/backup-system.sh
fi

echo
echo "======================================"
echo "✅ CachyOS-Installation abgeschlossen!"
echo "======================================"
