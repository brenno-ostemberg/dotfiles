alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"' ## Notifica fim de comando longo
alias theme='bash ~/.local/bin/toggle-theme.sh' ## Alterna tema claro/escuro
