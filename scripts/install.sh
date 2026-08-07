#!/usr/bin/env bash

set -e

echo "======================================"
echo "🚀 Philly Dotfiles Installer"
echo "======================================"
echo

# ==========================================
# Homebrew
# ==========================================

if ! command -v brew >/dev/null 2>&1; then
    echo "❌ Homebrew ist nicht installiert."
    echo "Bitte installiere Homebrew zuerst:"
    echo "https://brew.sh"
    exit 1
fi

echo "✅ Homebrew gefunden."
echo

# ==========================================
# Install Packages
# ==========================================

echo "📦 Installiere Pakete aus der Brewfile..."
brew bundle

echo

echo "📦 Pakete erfolgreich installiert."

echo
echo "🔗 Erstelle Symlinks..."
./scripts/symlinks.sh

echo
echo "✅ Installation abgeschlossen!"
