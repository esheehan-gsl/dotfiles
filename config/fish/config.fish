if status is-login
  pyenv init --path | source
end

if status is-interactive
  pyenv init - | source

  set -gx EDITOR vim

  abbr --add --global pbcopy 'xsel --clipboard --input'
  abbr --add --global pbpaste 'xsel --clipboard --output'
  abbr --add --global open 'xdg-open &>/dev/null'

  abbr --add --global rm 'rm -I'

  abbr --add --global l 'ls -lh'
  abbr --add --global ll 'ls -lha'
  abbr --add --global tree 'exa --tree'

  abbr --add --global fd 'fdfind'
  abbr --add --global find 'fdfind'
  abbr --add --global 'dci' 'docker rmi (docker images -a --filter=dangling=true -q)'

  abbr --add --global ps 'procs'
end

if test -e ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
