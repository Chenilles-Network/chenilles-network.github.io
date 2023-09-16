all: public

RECIPE = racket $< > $@.tmp && mv $@.tmp $@ || rm $@.tmp

public/%.html: %.rkt utils.rkt
	$(RECIPE)

public/%/index.html: %.rkt reveal.rkt
	mkdir -p public/$*
	$(RECIPE)

# whitepaper
docs = index whitepaper team concepts roadmap system

public: $(addprefix public/, $(addsuffix .html, $(docs)))

public/whitepaper.html:: whitepaper.md
public/concepts.html:: concepts.md
public/roadmap.html:: roadmap.md
public/system.html:: system.md

clean:
	rm -f public/index.html

mrproper:
	git clean -xfd

prerequisites:
	raco pkg install --auto --update-deps markdown

.PHONY: public all clean mrproper prerequisites
