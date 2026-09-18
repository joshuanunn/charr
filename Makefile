BIN := charr

.PHONY: all test test_lex test_parse test_exe regenerate_oracles clean

all:
	dune fmt || true
	dune build
	dune install

test: $(BIN)
	bash test/_runner.sh

test_lex: $(BIN)
	bash test/_runner.sh --phase lex

test_parse: $(BIN)
	bash test/_runner.sh --phase parse

test_exe: $(BIN)
	bash test/_runner.sh --phase exe

regenerate_oracles: $(BIN)
	bash test/_regenerate_oracles.sh

clean:
	dune clean
