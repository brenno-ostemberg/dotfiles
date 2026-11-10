#!/usr/bin/env bash
# Alterna a paleta da barra do tmux (dotbar) entre dark e light (One Light).

DOTBAR="${TMUX_PLUGIN_MANAGER_PATH:-$HOME/.local/share/tmux/plugins}/tmux-dotbar/dotbar.tmux"

if [ "$(tmux show -gv @bar-mode 2>/dev/null)" = "light" ]; then
  mode=dark
  bg='#0B0E14' fg='#475266' fg_current='#BFBDB6' fg_session='#565B66' fg_prefix='#95E6CB'
else
  mode=light
  bg='#FAFAFA' fg='#A0A1A7' fg_current='#383A42' fg_session='#696C77' fg_prefix='#50A14F'
fi

tmux set -g @bar-mode "$mode"
tmux set -g @tmux-dotbar-bg "$bg"
tmux set -g @tmux-dotbar-fg "$fg"
tmux set -g @tmux-dotbar-fg-current "$fg_current"
tmux set -g @tmux-dotbar-fg-session "$fg_session"
tmux set -g @tmux-dotbar-fg-prefix "$fg_prefix"
tmux run-shell "$DOTBAR"
tmux refresh-client -S
