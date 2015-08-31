TEX=xelatex -shell-escape
BIB=qa.bib opt.bib
BBL=odbstud.bbl

all: odbstud.pdf

$(BBL): $(BIB)
	rm -f $(BBL)
	$(TEX) odbstud
	bibtex odbstud || :
	$(TEX) odbstud

odbstud.pdf: odbstud.tex ranks.eps yodaqa-arch.eps answer-production.eps question-analysis.eps $(BBL)
	$(TEX) odbstud

ranks.eps: ranks.gle ranks.dat
	gle -cairo ranks.gle

clean:
	rm -f odbstud.pdf odbstud.aux odbstud.log odbstud.blg ranks.eps $(BBL)
