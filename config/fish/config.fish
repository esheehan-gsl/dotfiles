if status is-interactive
  abbr --add --global pbcopy 'xsel --clipboard --input'
  abbr --add --global pbpaste 'xsel --clipboard --output'
  abbr --add --global open 'xdg-open &>/dev/null'

  abbr --add --global rm 'rm -I'

  abbr --add --global l 'ls -lh'
  abbr --add --global ll 'ls -lha'

  abbr --add --global fd 'fdfind'
  abbr --add --global find 'fdfind'
end

if test -e ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
