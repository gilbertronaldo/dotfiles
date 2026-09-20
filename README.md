# Zenbook Dotfiles

Setup harian ASUS Zenbook 14 OLED (UM3406KA) — Ryzen AI 7 350 / Radeon 860M / Fedora 44.
Prinsip: minimal, no-bloat, gampang di-clone ke laptop baru.

Isi:
- `bash/` — `.bashrc`, `.bash_profile` (BASH + starship + atuin)
- `starship/` — preset starship (opsional, default bawaan kalau kosong)
- `atuin/` — template config atuin (tanpa key/history, itu private)
- `pipewire/pipewire.conf.d/` — EQ speaker Zenbook (ALC294 + CS35L41)
- `hushmic/` — config mic noise suppression
- `scripts/` — `install.sh` (symlink aman) + `packages.sh` (daftar paket Fedora)

## Cara pakai di laptop baru

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./scripts/packages.sh   # install paket yang dibutuhkan (review dulu isinya)
./scripts/install.sh    # symlink config ke $HOME (backup otomatis .bak)
```

Setelah itu:
```bash
systemctl --user restart pipewire
# login ulang / restart shell biar starship + atuin ke-load
```

## Catatan

- Gaze (face auth) TIDAK di-backup di sini: config-nya di `/etc/gaze/` (root)
  + data wajah (private). Install manual via RPM + `gaze add-face`.
- History atuin + key enkripsi TIDAK ikut (private). Login atuin manual:
  `atuin login` / `atuin register` kalau pakai sync server.
- Charge limit 80 + tuned `balanced-battery` itu setting sistem (bukan dotfiles),
  cek ulang di laptop baru.
