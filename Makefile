all: public

public/%.html: %.rkt utils.rkt info $(wildcard %.md)
	racket $< > $@.tmp && mv $@.tmp $@ || rm $@.tmp

public/%/index.html: %.rkt reveal.rkt
	mkdir -p public/$*
	racket $< > $@.tmp && mv $@.tmp $@ || rm $@.tmp

# whitepaper
docs = index whitepaper team concepts roadmap system

public: info $(addprefix public/, $(addsuffix .html, $(docs)))

info:
	echo PWD=$$PWD HOME=$$HOME GITHUB_WORKSPACE=$$GITHUB_WORKSPACE ; ls -l

clean:
	rm -f public/index.html

mrproper:
	git clean -xfd

prerequisites:
	raco pkg install --auto --update-deps markdown

.PHONY: public all clean mrproper info prerequisites
