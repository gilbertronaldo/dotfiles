# ~/dotfiles

My personal dotfiles. Minimal, no-bloat, easy to clone on a fresh machine.

**Current daily:** ASUS Zenbook 14 OLED (UM3406KA) — Ryzen AI 7 350 / Radeon 860M / Fedora 44, BASH + starship + atuin.

```
.
├── assets/    # screenshots & static files
├── config/    # all dotfiles
│   ├── atuin/     # atuin template (no keys/history — private)
│   ├── bash/      # .bashrc, .bash_profile
│   ├── hushmic/   # mic noise suppression
│   ├── pipewire/  # Zenbook speaker EQ (ALC294 + CS35L41)
│   └── starship/  # prompt preset (optional)
├── docs/      # setup notes
├── legacy/    # my 2020 Arch setup (i3, polybar, nvim, termite, compton)
├── scripts/
│   ├── install.sh   # symlink everything to $HOME (auto-backup, idempotent)
│   └── packages.sh  # Fedora package list
└── README.md
```

## Quick start

```bash
git clone https://github.com/gilbertronaldo/dotfiles.git ~/src/gilbertronaldo/dotfiles
cd ~/src/gilbertronaldo/dotfiles
./scripts/packages.sh   # review first, installs Fedora packages
./scripts/install.sh    # symlinks configs (backs up existing files)
systemctl --user restart pipewire
```

## Notes

- **Gaze** (face auth) is not in here: config lives in `/etc/gaze/` + enrolled
  face data is private. Install the RPMs, then `gaze add-face`.
- **Atuin** history + encryption keys stay private (`~/.local/share/atuin`).
  Run `atuin login` / `atuin register` if you use a sync server.
- System-level stuff (charge limit 80, tuned `balanced-battery`) is not
  dotfiles — re-check on a new machine.

## History

- **2020** — Arch Linux rice: i3 + polybar + neovim + termite + compton.
  Preserved under [`legacy/`](legacy/). Screenshots:

  ![arch](legacy/arch-2020-assets/archlinux_review_neofetch.png)
  ![clear](legacy/arch-2020-assets/clearlinux_review_neofetch.png)

- **2026** — Zenbook 14 OLED on Fedora: BASH + starship + atuin, PipeWire
  speaker EQ, hushmic. The `config/` + `scripts/` setup above.
