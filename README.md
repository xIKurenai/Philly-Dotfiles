# 🚀 Philly Dotfiles

Mein persönliches Linux-Setup – mit Fokus auf ein modernes,
reproduzierbares und leicht wartbares System.

> Dieses Repository enthält meine persönlichen Konfigurationen,
> Installationsskripte und Softwarelisten für CachyOS.

---

## 🖥️ Aktuelles System

- **Distro:** CachyOS
- **Desktop:** KDE Plasma
- **Geplant:** Hyprland
- **Shell:** Bash
- **Terminal:** Kitty
- **Prompt:** Starship
- **System Fetch:** Fastfetch

---

## 📦 Software

### 🛠️ CLI

- bat
- btop
- eza
- fastfetch
- fd
- fzf
- lazygit
- ripgrep
- starship
- zoxide

### 🎮 Gaming

- Steam
- Heroic Games Launcher
- ProtonPlus
- Protontricks
- Prism Launcher

### 🖥️ Desktop / GUI

- Kitty
- Firefox
- Discord
- KDE Apps
- Flatseal
- Warehouse

Native Pakete werden über `packages/pacman.txt` verwaltet.
Flatpaks werden über `packages/flatpak.txt` verwaltet.

---

## 📁 Repository-Struktur

```text
Philly-Dotfiles/
├── .bashrc
├── .config/
│   ├── fastfetch/
│   │   └── config.jsonc
│   ├── kitty/
│   │   ├── current-theme.conf
│   │   └── kitty.conf
│   └── starship.toml
├── packages/
│   ├── pacman.txt
│   └── flatpak.txt
├── scripts/
│   ├── backup.sh
│   ├── install.sh
│   └── symlinks.sh
├── wallpapers/
├── fonts/
├── docs/
├── Brewfile
├── .gitignore
├── LICENSE
└── README.md
```

## 🚧 Roadmap

- [x] Git eingerichtet
- [x] Repository erstellt
- [x] Kitty übernehmen
- [x] Starship übernehmen
- [x] Fastfetch übernehmen
- [x] Bash-Konfiguration übernehmen
- [x] Installationsskript erstellen
- [x] Backup-System erstellen
- [x] Symlink-System erstellen
- [x] CachyOS-Paketverwaltung einrichten
- [x] Flatpak-Paketverwaltung einrichten
- [x] Gaming-Software dokumentieren
- [ ] Hyprland konfigurieren
- [ ] Waybar konfigurieren
- [ ] Walker konfigurieren

## 📄 Lizenz

MIT License
