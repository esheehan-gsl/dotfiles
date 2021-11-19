if status is-login
  pyenv init --path | source
end

if status is-interactive
  pyenv init - | source

  abbr --add --global pbcopy 'xsel --clipboard --input'
  abbr --add --global pbpaste 'xsel --clipboard --output'
  abbr --add --global open 'xdg-open &>/dev/null'

  abbr --add --global rm 'rm -I'

  abbr --add --global l 'ls -lh'
  abbr --add --global ll 'ls -lha'

  abbr --add --global fd 'fdfind'
  abbr --add --global find 'fdfind'
  abbr --add --global 'dci' 'docker rmi (docker images -a --filter=dangling=true -q)'
end

if test -e ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
