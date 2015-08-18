TEX=xelatex -shell-escape
BIB=qa.bib
BBL=$(BIB:%.bib=%.bbl)

all: odbstud.pdf

$(BBL): $(BIB)
	rm -f $(BBL)
	$(TEX) odbstud
	bibtex odbstud || :
	$(TEX) odbstud

odbstud.pdf: odbstud.tex ranks.eps yodaqa-arch.eps $(BBL)
	$(TEX) odbstud

ranks.eps: ranks.gle
	gle -cairo ranks.gle

clean:
	rm -f odbstud.pdf odbstud.aux odbstud.log odbstud.blg ranks.eps $(BBL)
