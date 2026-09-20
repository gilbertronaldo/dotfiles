# Zenbook Dotfiles

Setup harian ASUS Zenbook 14 OLED (UM3406KA) — Ryzen AI 7 350 / Radeon 860M / Fedora 44.
Prinsip: minimal, no-bloat, gampang di-clone ke laptop baru.

```
.
├── assets/      # screenshot, foto, file statis (bebas)
├── config/      # semua dotfiles
│   ├── atuin/       # template config atuin (tanpa key/history, private)
│   ├── bash/        # .bashrc, .bash_profile (BASH + starship + atuin)
│   ├── hushmic/     # config mic noise suppression
│   ├── pipewire/    # EQ speaker Zenbook (ALC294 + CS35L41)
│   └── starship/    # preset starship (opsional)
├── docs/        # catatan setup (tambahin sesuai kebutuhan)
├── scripts/
│   ├── install.sh   # symlink config ke $HOME (backup otomatis .bak)
│   └── packages.sh  # daftar paket Fedora
└── README.md
```

## Cara pakai di laptop baru

```bash
git clone https://github.com/gilbertronaldo/zenbook-dotfiles.git ~/src/gilbertronaldo/dotfiles
cd ~/src/gilbertronaldo/dotfiles
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
