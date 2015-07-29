R_SCRIPT=/usr/local/R/R-3.2.x/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT))}'

template: template.Rmd
	$(RENDER) render("template.Rmd" $(RENDER_END)

softlinks:
	for wk in 1 2 3 4; do cd week$$wk; ln -s ../_output.yaml _output.yaml; cd ..; done
	for wk in 1 2 3 4; do cd week$$wk; ln -s ../genbioconductor.bib genbioconductor.bib; cd ..; done
	for wk in 1 2 3 4; do cd week$$wk; ln -s ../front.Rmd front.Rmd; cd ..; done

clean:
	rm -f *.html *.pdf

