.PHONY: all fmt build install test test_lex test_parse test_exe regenerate_oracles clean

all: install

fmt:
	dune fmt || true

build: fmt
	dune build

install: build
	dune install

test: install
	bash test/_runner.sh

test_lex: install
	bash test/_runner.sh --phase lex

test_parse: install
	bash test/_runner.sh --phase parse

test_exe: install
	bash test/_runner.sh --phase exe

regenerate_oracles: install
	bash test/_regenerate_oracles.sh

clean:
	dune clean
