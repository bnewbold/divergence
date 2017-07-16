
INSTALL ?= install
PREFIX ?= /usr

.PHONY: build
build:
	echo "Nothing to build"

.PHONY: install
install:
	$(INSTALL) -t $(PREFIX)/bin divergence
	$(INSTALL) -d $(PREFIX)/lib/divergence
	$(INSTALL) -t $(PREFIX)/lib/divergence pandoc_confluence.lua -m 0644
	$(INSTALL) -t $(PREFIX)/lib/divergence meta-json.template -m 0644

