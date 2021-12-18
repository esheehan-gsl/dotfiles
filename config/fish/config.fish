if status is-interactive
  set -gx EDITOR vim

  abbr --add --global pbcopy 'xsel --clipboard --input'
  abbr --add --global pbpaste 'xsel --clipboard --output'
  abbr --add --global open 'xdg-open &>/dev/null'

  abbr --add --global rm 'rm -I'

  abbr --add --global l 'exa -lh --git'
  abbr --add --global ll 'exa -lha --git'

  abbr --add --global tree 'exa --tree'

  abbr --add --global fd 'fdfind'

  abbr --add --global ps 'procs'
end
