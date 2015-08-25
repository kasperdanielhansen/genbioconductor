R_SCRIPT=/usr/bin/Rscript

%.html: %.Rmd .FORCE
	$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);\
                       render("$*.Rmd", \
                              output_format="BiocStyle::html_document",\
                              output_options=list(toc=TRUE))}'
	$(R_SCRIPT) -e '{library(knitr);\
                        purl("$*.Rmd")}'
	sed -i.bak -nEe '/## ----dependencies/, $$p' $*.R
	rm $*.R.bak

.PHONY: fixme all clean $(RMDS)

.FORCE :

Getting_Data_into_Bioconductor : Getting_Data_into_Bioconductor.html

fixme:
	grep FIXME *.Rmd *.md

clean:
	rm -f *~ *.pdf

