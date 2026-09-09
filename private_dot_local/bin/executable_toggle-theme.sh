# ~/.local/bin/toggle-theme.sh
CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$CURRENT" = "'default'" ] || [ "$CURRENT" = "'prefer-dark'" ]; then
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
