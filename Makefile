PANDOC = pandoc
IFORMAT = markdown
FLAGS = --standalone --toc --toc-depth=2 --mathjax=$(MATHJAX)
STYLE = css/style.css
FILTER = includes.hs
ifdef MATHJAX_LOCAL
  MATHJAX = ${MATHJAX_LOCAL}
else
  MATHJAX ?= "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
endif

TEMPLATE_HTML = templates/template.html
TEMPLATE_TEX = templates/template.latex

SRC = src/000_introduction.md \
      src/001_example.md \
      src/002_specs.md \
      src/003_proving.md \
      src/004_advanced.md \
      src/005_biblio.md \
      src/006_appendix.md
OBJ = $(subst .md,.html,$(subst src,book,$(SRC)))

all: $(OBJ)

book/%.html: src/%.md $(FILTER) $(TEMPLATE_HTML) $(FILTER) latex_macros
	$(PANDOC) -c $(STYLE) --filter ${FILTER} \
	  --template $(TEMPLATE_HTML) -s -f $(IFORMAT) \
	  -t html $(FLAGS) -o $@ $<

pdf: $(FILTER)
	$(PANDOC) --filter ${FILTER} -f $(IFORMAT) \
	  --template $(TEMPLATE_TEX) --latex-engine=xelatex $(FLAGS) \
	  -o AutoGnP.pdf $(SRC)


clean:
	-rm book/*.html *.pdf
