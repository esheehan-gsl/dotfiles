SHELL = /bin/sh

XDG_CONFIG_DIR ?= ~/.config

XDG_CONFIGS = nvim

# List of all dotfiles that in live in the home directory
HOMEFILES = $(patsubst home/%,~/.%,$(wildcard home/*))

# List of all local user scripts
SCRIPTS = $(foreach f,$(wildcard bin/*),~/.local/$(f))

.PHONY = all delegates

all : $(HOMEFILES) $(SCRIPTS) delegates \
	$(foreach c,$(XDG_CONFIGS),$(XDG_CONFIG_DIR)/$(c))

# Copy home files into the home directory
~/.% : home/%
	cp -v $? $@

# Useful scripts
~/.local/bin/% : bin/% | ~/.local/bin
	cp -v $? $@

~/.local/bin :
	mkdir -p ~/.local/bin

# Config that follow the XDG base directory spec
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

delegates: */Makefile
	$(MAKE) -C $(dir $?) -e XDG_CONFIG_DIR=$(XDG_CONFIG_DIR)

