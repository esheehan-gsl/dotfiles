SHELL = /bin/sh

# List of all dotfiles that in live in the home directory
HOMEFILES = $(patsubst home/%,~/.%,$(wildcard home/*))

# List of all local user scripts
SCRIPTS = $(foreach f,$(wildcard bin/*),~/.local/$(f))

.PHONY = all

all : $(HOMEFILES) $(SCRIPTS)

# Copy home files into the home directory
~/.% : home/%
	cp -v $? $@

~/.local/bin/% : bin/% | ~/.local/bin
	cp -v $? $@

~/.local/bin :
	mkdir -p ~/.local/bin
