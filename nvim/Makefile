INSTALL_DIR := $(XDG_CONFIG_DIR)/nvim

CONFIG_FILES := $(foreach f,$(wildcard *.vim),$(INSTALL_DIR)/$f)
PLUG         := $(INSTALL_DIR)/autoload/plug.vim

.PHONY = all

all : $(CONFIG_FILES) plugins_installed

$(INSTALL_DIR)/%.vim : %.vim | $(INSTALL_DIR)
	cp -v $? $@

$(PLUG) : | $(INSTALL_DIR)/autoload
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mv plug.vim $@

plugins_installed : my_plugins.vim $(PLUG)
	nvim --headless +PlugUpgrade +qall
	nvim --headless +PlugClean! +PlugInstall! +PlugUpdate! +UpdateRemotePlugins! +qall
	touch $@

$(INSTALL_DIR)/autoload :
	mkdir -p $@

$(INSTALL_DIR) :
	mkdir -p $@
