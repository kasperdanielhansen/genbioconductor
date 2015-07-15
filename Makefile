R_SCRIPT=/usr/local/R/R-3.2.x/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT))}'

iranges : iranges.Rmd
	$(RENDER) render("iranges.Rmd" $(RENDER_END)

clean:
	rm -f *.html *.pdf

