R_SCRIPT=/usr/local/R/R-3.2.x/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT))}'
RENDER2=$(R_SCRIPT) -e '{library(knitr);
RENDER2_END=)}'

Materials_Week2 : Materials_Week2.md
	pandoc -o Materials_Week2.html Materials_Week2.md
	open Materials_Week2.html

iranges-intermediate: iranges-intermediate.Rmd
	$(RENDER) render("iranges-intermediate.Rmd" $(RENDER_END)
	$(RENDER2) purl("iranges-intermediate.Rmd" $(RENDER2_END)

fixme:
	grep FIXME *.Rmd

all: Materials_Week2 

clean:
	rm -f *~ *.pdf

