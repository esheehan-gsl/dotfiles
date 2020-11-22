SHELL = /bin/sh

HOMEFILES = ~/.bashrc \
			~/.gitconfig \
			~/.tmux.conf \
			~/.vimrc \
			~/.zshrc

# List of all local user scripts
SCRIPTS = $(foreach f,$(wildcard local/bin/*),~/.$(f))

.PHONY = all delegates vim

all : $(HOMEFILES) $(SCRIPTS) \
	~/.config/alacritty/alacritty.yml \
	~/.config/nvim/init.vim

# Copy home files into the home directory
~/.% : %
	cp -v $? $@

# Alacritty
~/.config/alacritty/alacritty.yml : config/alacritty/alacritty.yml | ~/.config
	mkdir -p ~/.config/alacritty/
	cp $? $@

# NeoVim
~/.config/nvim/init.vim : config/nvim/init.vim | ~/.config/nvim/autoload/plug.vim ~/.vimrc
	cp $? $@
	nvim --headless +PlugUpgrade +qall
	nvim --headless +PlugClean! +PlugInstall! +PlugUpdate! +UpdateRemotePlugins! +qall

~/.config/nvim/autoload/plug.vim : | ~/.config
	mkdir -p ~/.config/nvim/autoload
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O $@

~/.config :
	mkdir -p ~/.config

# Useful scripts
~/.local/bin/% : local/bin/% | ~/.local/bin
	cp -v $? $@

~/.local/bin :
	mkdir -p ~/.local/bin

