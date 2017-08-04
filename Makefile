BIN = ./node_modules/.bin

build:
	@$(BIN)/bsb -make-world

watch:
	@$(BIN)/bsb -make-world -w

clean:
	@$(BIN)/bsb -clean-world
	@rm -rf lib
