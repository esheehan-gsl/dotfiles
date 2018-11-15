INSTALL_DIR := $(XDG_CONFIG_DIR)/nvim

CONFIG_FILES := $(foreach f,$(wildcard *.vim),$(INSTALL_DIR)/$f)
PLUG         := $(INSTALL_DIR)/autoload/plug.vim

.PHONY = all

all : $(CONFIG_FILES) plugins_installed

$(INSTALL_DIR)/%.vim : %.vim
	cp -v $? $@

$(PLUG) :
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

plugins_installed : my_plugins.vim $(PLUG)
	nvim +PlugUpgrade +qall --headless
	nvim +PlugInstall +PlugClean! +PlugUpdate +qall --headless
	touch $@
