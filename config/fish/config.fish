if status is-interactive
  set -gx EDITOR vim

  abbr --add --global pbcopy 'xsel --clipboard --input'
  abbr --add --global pbpaste 'xsel --clipboard --output'
  abbr --add --global open 'xdg-open &>/dev/null'

  abbr --add --global rm 'rm -I'

  abbr --add --global l 'ls -lh'
  abbr --add --global ll 'ls -lh --all'

  abbr --add --global tree 'exa --tree'

  abbr --add --global find 'fdfind'

  abbr --add --global ps 'procs'
end
