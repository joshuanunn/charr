.PHONY: all fmt build install test test_lex test_parse test_exe regenerate_oracles web_build web_deploy web_serve clean

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

web_build:
	dune build --profile release web/charr_web.bc.js

web_deploy: web_build
	rm -rf _site
	mkdir -p _site
	install -m 644 web/index.html _site/
	install -m 644 _build/default/web/charr_web.bc.js _site/

web_serve: web_deploy
	python3 -m http.server -d _site 8000

clean:
	dune clean
