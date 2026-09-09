# Ajuda

# ANSI e tab vêm de $'...' porque o sed do BSD não interpreta \x1b nem \t.
_bhelp_from() {
  local cyan=$'\033[36m' reset=$'\033[0m' tab=$'\t'
  grep -hE '^(alias [a-zA-Z_-]+=|[a-zA-Z_-]+\(\))' "$@" 2>/dev/null |
    grep '##' |
    sed -E "s/.*(alias |^)([a-zA-Z_-]+).+## (.*)/${cyan}\2${reset}${tab}\3/" |
    sort |
    column -t -s "$tab"
}

bhelp() { ## Lista todos os atalhos de ~/.config/shell
  _bhelp_from "$HOME"/.config/shell/*.sh
}

# Tmux

tns() { ## Cria sessao tmux com diretorio especifico
  local name="$1"
  local directory="$2"

  tmux new-session -s "$name" -c "$directory"
}

tw() { ## Cria janelas tmux com nomes especificos
  local session=$1
  shift
  if [ -z "$session" ] || [ "$#" -eq 0 ]; then
    echo "uso: tw <sessão> <janela1> [janela2 ...]" >&2
    return 1
  fi

  if ! tmux has-session -t "=$session" 2>/dev/null; then
    echo "tw: sessão '$session' não existe" >&2
    return 1
  fi

  local existing
  existing=$(tmux list-windows -t "=$session" -F '#{window_name}')

  local name
  for name in "$@"; do
    if printf '%s\n' "$existing" | grep -qxF "$name"; then
      continue
    fi
    tmux new-window -d -t "=$session" -n "$name"
  done
}
