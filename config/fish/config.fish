# Author: Evan Sheehan <darth_mall@pm.me>
# Description: fish configuration
# vim: set fdm=marker fdl=0 ts=2 sw=2 tw=80 :

if status is-login
	pyenv init --path | source
end

if status is-interactive
	pyenv init - | source

	fish_add_path ~/.local/bin

	set -gx EDITOR vim
	set --universal nvm_default_version lts

	abbr --add --global pbcopy 'xclip -in -selection clipboard'
	abbr --add --global pbpaste 'xclip -out -selection clipboard'
	abbr --add --global open 'xdg-open &>/dev/null'

	abbr --add --global rm 'rm -I'

	abbr --add --global l 'exa --long --header --git'
	abbr --add --global ll 'exa --long --header --git --all'
	abbr --add --global lt 'exa --long --header --git --all --tree'
	abbr --add --global tree 'exa --tree'

	abbr --add --global fd 'fdfind'
	abbr --add --global 'dci' 'docker rmi (docker images -a --filter=dangling=true -q)'

	abbr --add --global p 'procs'

	abbr --add --global c 'batcat'
end

if test -e ~/.config/fish/local.fish
	source ~/.config/fish/local.fish
end
