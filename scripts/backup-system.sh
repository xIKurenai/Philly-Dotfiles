#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$ROOT/system-backup"
mkdir -p "$BACKUP_DIR"

echo "======================================"
echo "💾 CachyOS System Backup"
echo "======================================"
echo

# Native packages installed explicitly by the user.
echo "📦 Exportiere pacman-Pakete..."
pacman -Qqe | sort > "$BACKUP_DIR/pacman-packages.txt"

# Foreign packages are useful for identifying AUR packages.
# pacman returns a non-zero status when no foreign packages exist.
echo "📦 Exportiere AUR/Foreign-Pakete..."
pacman -Qqm | sort > "$BACKUP_DIR/aur-packages.txt" || true

# Flatpak applications installed for the current user and system-wide.
if command -v flatpak >/dev/null 2>&1; then
    echo "📦 Exportiere Flatpak-Anwendungen..."
    flatpak list --app --columns=application | sort -u > "$BACKUP_DIR/flatpak-apps.txt"
fi

# Enabled systemd services, excluding transient/generated units.
echo "⚙️ Exportiere aktivierte systemd-Services..."
systemctl list-unit-files --state=enabled --no-legend --no-pager \
    | awk '{print $1}' \
    | sort > "$BACKUP_DIR/enabled-services.txt"

# Basic machine information for documentation/troubleshooting.
echo "🖥️ Exportiere Systeminformationen..."
{
    echo "Hostname: $(hostname)"
    echo "Kernel: $(uname -r)"
    echo "Architecture: $(uname -m)"
    if command -v cachyos-about >/dev/null 2>&1; then
        cachyos-about 2>/dev/null || true
    fi
} > "$BACKUP_DIR/system-info.txt"

echo
echo "✅ Backup-Inventur abgeschlossen."
echo "📁 Ausgabe: $BACKUP_DIR"
echo
echo "⚠️ Keine Passwörter, SSH-Keys, Tokens oder persönlichen Dateien werden erfasst."
