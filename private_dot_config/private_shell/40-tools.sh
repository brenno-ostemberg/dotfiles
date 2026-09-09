command -v starship >/dev/null 2>&1 && eval "$(starship init "$CURRENT_SHELL")"
command -v mise >/dev/null 2>&1 && eval "$(mise activate "$CURRENT_SHELL")"

if command -v go >/dev/null 2>&1; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi
