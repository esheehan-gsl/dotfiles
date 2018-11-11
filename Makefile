SHELL = /bin/sh

# List of all dotfiles that in live in the home directory
HOMEFILES = $(patsubst home/%,~/.%,$(wildcard home/*))

.PHONY = all

all : $(HOMEFILES)

# Copy home files into the home directory
~/.% : home/%
	cp -v $? $@
