
INSTALL_DIR := $(XDG_LOCAL_DIR)/share/fonts

FONTS := $(addprefix $(INSTALL_DIR)/, $(notdir $(wildcard Hack/build/ttf/*.ttf FiraCode/distr/otf/*.otf)))

VPATH = FiraCode/distr/otf Hack/build/ttf

.PHONY = all

all : $(FONTS)
	fc-cache $(INSTALL_DIR)

$(INSTALL_DIR)/% : % | $(INSTALL_DIR)
	cp -v $? $@

$(INSTALL_DIR) :
	mkdir -p $@

