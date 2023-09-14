all: public

public/%.html: %.rkt utils.rkt $(wildcard %.md)
	racket $< > $@.tmp && mv $@.tmp $@ || rm $@.tmp

public/%/index.html: %.rkt reveal.rkt
	mkdir -p public/$*
	racket $< > $@.tmp && mv $@.tmp $@ || rm $@.tmp

# whitepaper
docs = index whitepaper team concepts roadmap system

public: $(addprefix public/, $(addsuffix .html, $(docs)))

clean:
	rm -f public/index.html

mrproper:
	git clean -xfd

prerequisites:
	raco pkg install --auto --update-deps commonmark

gh-pages:
	for i in $(docs) ; do racket $$i.rkt > $$i.tmp && \
	mv $$i.tmp public/$$i.html || rm $$i.tmp ; done

.PHONY: public all clean mrproper prerequisites gh-pags
