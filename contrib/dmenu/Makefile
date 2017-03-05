PREFIX ?= /usr
DESTDIR ?=
BINDIR ?= $(PREFIX)/bin

all:
		@echo "Passhmenu is a shell script (it requires dmenu), so there is nothing to do. Try \"make install\" as privileged user instead."

install-common:
		if [ -z "`which dmenu`" ]; then apt install dmenu; else true; fi
		@install -v -d "$(DESTDIR)$(BINDIR)/" && install -m 0755 -v passhmenu "$(DESTDIR)$(BINDIR)/passhmenu"

install: install-common

uninstall:
		@rm -vrf "$(DESTDIR)$(BINDIR)/passhmenu"

.PHONY: install uninstall install-common 
