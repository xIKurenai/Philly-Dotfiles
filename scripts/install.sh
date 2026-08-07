#!/usr/bin/env bash

set -e

echo "======================================"
echo "🚀 Philly Dotfiles Installer"
echo "======================================"
echo

echo "Installing Homebrew packages..."
brew bundle --file=Brewfile

echo
echo "Done!"
