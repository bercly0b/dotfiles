# dotfiles

Personal terminal setup: zsh (oh-my-zsh), tmux (tpm), Neovim (Lua, lazy.nvim), Ghostty, snippets. Home files source/symlink into `~/self/dotfiles` (see `README.md` and `init-env.sh`).

## Two environments

The same configs run in two places, often at once (tmux on a server inside Ghostty on the Mac):

- **Local Mac**: Ghostty + zsh + tmux + nvim, Homebrew, latest tool versions.
- **Remote Linux over SSH** (Debian/Ubuntu, usually set up by `init-env.sh`): zsh + tmux + nvim, no GUI, no battery, older tool versions (tmux from apt).

When changing anything:

- Think about where it runs. Mac-only features (battery, `pbcopy`, `/opt/homebrew`, Ghostty) need a runtime check and must do nothing on Linux, and the reverse.
- Checks: zsh `[[ $OSTYPE == darwin* ]]`, tmux `if-shell 'uname | grep -q Darwin'`, nvim `vim.fn.has('mac') == 1`.
- Don't use tmux/nvim options newer than what the servers have without a guard.
- `open` is the reference example of picking behavior per environment.

## Colors

Flexoki. The `theme = ...` line in `ghostty/config` is the only light/dark switch. tmux, fzf and zsh style with terminal palette colors only (`colour0`–`colour15`, ANSI names), so they follow Ghostty, also over SSH. nvim needs hex colors, so `lua/theme.lua` parses that line.

## Conventions

- Commits: `<area>: <what>` (`vim:`, `zsh:`, `tmux:`, `init:`).
