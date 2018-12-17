SHELL = /bin/sh

XDG_CONFIG_DIR ?= ~/.config
XDG_LOCAL_DIR  ?= ~/.local

XDG_CONFIGS = nvim

# List of all dotfiles that in live in the home directory
HOMEFILES = $(patsubst home/%,~/.%,$(wildcard home/*))

# List of all local user scripts
SCRIPTS = $(foreach f,$(wildcard bin/*),~/.local/$(f))

.PHONY = all delegates

all : $(HOMEFILES) $(SCRIPTS) \
	$(foreach c,$(XDG_CONFIGS),$(XDG_CONFIG_DIR)/$(c)) \
	delegates \
	installed/oceanic-next-gnome-terminal

# Copy home files into the home directory
~/.% : home/%
	cp -v $? $@

# Useful scripts
~/.local/bin/% : bin/% | ~/.local/bin
	cp -v $? $@

~/.local/bin :
	mkdir -p ~/.local/bin

installed/oceanic-next-gnome-terminal : | installed
	./oceanic-next-gnome-terminal/oceanic-next.bash
	touch $@

# Config that follow the XDG base directory spec
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

delegates : */Makefile
	for DELEGATE in $(^D); do \
		${MAKE} -C $$DELEGATE \
			-e XDG_CONFIG_DIR=$(XDG_CONFIG_DIR) \
			-e XDG_LOCAL_DIR=$(XDG_LOCAL_DIR); \
	done

installed :
	mkdir installed
