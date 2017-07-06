NOM=$(shell basename `pwd`)

compile:
	openout_any=a pdflatex -jobname .$(NOM) -halt-on-error MAIN.tex
	mv .$(NOM).pdf $(NOM).pdf &

clean:
	rm -rf *~        # removes the backup files
	rm -f $(NOM).pdf      # removes the pdf output
	rm -f .$(NOM)*   # removes the compilation files

draft:
	openout_any=a pdflatex -draftmode -jobname .$(NOM) -halt-on-error MAIN.tex   #does not build pdf

biblio: draft
	openout_any=a bibtex .$(NOM).aux;
	make draft
	make compile
	#xdg-open $(NOM).pdf &
