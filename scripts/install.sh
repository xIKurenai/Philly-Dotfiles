#!/usr/bin/env bash

set -euo pipefail

echo "======================================"
echo "🚀 Philly Dotfiles Installer"
echo "======================================"
echo

# ==========================================
# CachyOS / Arch Linux
# ==========================================

if ! command -v pacman >/dev/null 2>&1; then
    echo "❌ pacman wurde nicht gefunden."
    echo "Dieses Installationsskript ist für CachyOS/Arch Linux gedacht."
    exit 1
fi

echo "✅ Arch/CachyOS erkannt."
echo

# ==========================================
# Install native packages
# ==========================================

if [[ -f packages/pacman.txt ]]; then
    echo "📦 Installiere native Pakete..."
    mapfile -t packages < <(grep -vE '^\s*(#|$)' packages/pacman.txt)

    if ((${#packages[@]})); then
        sudo pacman -S --needed "${packages[@]}"
    fi
else
    echo "⚠️ packages/pacman.txt nicht gefunden – überspringe native Pakete."
fi

echo

# ==========================================
# Install Flatpaks
# ==========================================

if command -v flatpak >/dev/null 2>&1 && [[ -f packages/flatpak.txt ]]; then
    echo "📦 Installiere Flatpaks..."
    while IFS= read -r app; do
        [[ -z "$app" || "$app" =~ ^[[:space:]]*# ]] && continue
        flatpak install -y flathub "$app"
    done < packages/flatpak.txt
else
    echo "⚠️ Flatpak oder packages/flatpak.txt nicht gefunden – überspringe Flatpaks."
fi

echo

# ==========================================
# Backup & symlinks
# ==========================================

echo "💾 Sichere vorhandene Konfigurationen..."
./scripts/backup.sh

echo
echo "🔗 Erstelle Symlinks..."
./scripts/symlinks.sh

echo
echo "======================================"
echo "✅ Installation abgeschlossen!"
echo "======================================"
