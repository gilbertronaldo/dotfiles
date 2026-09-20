#!/usr/bin/env bash
# Daftar paket Fedora untuk Zenbook UM3406KA. Review sebelum jalan.
# Usage: ./scripts/packages.sh
set -euo pipefail

echo "== Paket dari repo resmi Fedora =="
sudo dnf install -y \
  starship \
  atuin \
  pipewire pipewire-pulseaudio wireplumber \
  btop

echo
echo "== Paket pihak ketiga (manual, tidak otomatis) =="
echo "- hushmic  : RPM dari rilis upstream (mic noise suppression)"
echo "- gaze     : RPM gaze + gaze-gui + gaze-gnome-extension (face auth)"
echo "  Lalu: gaze add-face ; aktifkan extension di GNOME Extensions."
echo
echo "Selesai."
