#!/usr/bin/env bash
# Symlink dotfiles ke $HOME dengan backup otomatis (*.bak-TIMESTAMP).
# Aman di-run ulang (idempotent).
set -euo pipefail
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "OK   $dest (sudah symlink)"
    return
  fi
  if [[ -e "$dest" || -L "$dest" ]]; then
    local bak="${dest}.bak-$(date +%Y%m%d-%H%M%S)"
    echo "BACKUP $dest -> $bak"
    mv "$dest" "$bak"
  fi
  ln -s "$src" "$dest"
  echo "LINK $dest -> $src"
}

echo "== Zenbook dotfiles install =="
link "$DOTFILES_DIR/bash/.bashrc"        "$HOME/.bashrc"
link "$DOTFILES_DIR/bash/.bash_profile"  "$HOME/.bash_profile"
link "$DOTFILES_DIR/pipewire/pipewire.conf.d/zenbook-speaker-eq.conf" \
     "$HOME/.config/pipewire/pipewire.conf.d/zenbook-speaker-eq.conf"
link "$DOTFILES_DIR/hushmic/config.toml" "$HOME/.config/hushmic/config.toml"

# starship: hanya symlink kalau user sudah punya starship.toml beneran
if [[ -f "$DOTFILES_DIR/starship/starship.toml" ]]; then
  link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
else
  echo "SKIP starship.toml (pakai default bawaan; contoh di starship/starship.toml.example)"
fi

echo
echo "Atuin: config TIDAK di-symlink otomatis (berisi key/sync private)."
echo "  Lihat atuin/config.toml.example sebagai referensi."
echo
echo "Selesai. Jalankan: systemctl --user restart pipewire"
