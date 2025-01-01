.DEFAULT_GOAL = install

AT    := @
ARCH  := $(shell uname -m | tr '[:upper:]' '[:lower:]')
OS    := $(shell uname -s | tr '[:upper:]' '[:lower:]')
DATE  := $(shell date +%Y-%m-%dT%T%Z)
SHELL := /usr/bin/env bash -euo pipefail -c

.PHONY: install
install:
	$(AT) bash install

todo:
	$(AT) grep \
		--exclude=Makefile \
		--exclude-dir={./test/bats,./test/helper,.git} \
		--color \
		--text \
		-inRo -E 'TODO:.*' . || true
.PHONY: todo

verbose:
	$(eval AT :=) $(eval MAKE := $(MAKE) verbose) @true
.PHONY: verbose