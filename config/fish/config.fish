if status is-interactive
  fish_add_path ~/.local/bin

  set -gx EDITOR vim

  abbr --add --global pbcopy 'xclip -in -selection clipboard'
  abbr --add --global pbpaste 'xclip -out -selection clipboard'
  abbr --add --global open 'xdg-open &>/dev/null'

  abbr --add --global rm 'rm -I'

  abbr --add --global l 'exa -lh --git'
  abbr --add --global ll 'exa -lha --git'

  abbr --add --global tree 'exa --tree'

  abbr --add --global fd 'fdfind'

  abbr --add --global ps 'procs'
end
