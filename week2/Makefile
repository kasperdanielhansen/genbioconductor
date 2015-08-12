R_SCRIPT=/usr/local/R/R-3.2.x/bin/Rscript
OUTPUT_FORMAT="BiocStyle::html_document"
RENDER=$(R_SCRIPT) -e '{library(rmarkdown); library(BiocStyle);
RENDER_END=, output_format = $(OUTPUT_FORMAT))}'
RENDER2=$(R_SCRIPT) -e '{library(knitr);
RENDER2_END=)}'

Materials_Week2 : Materials_Week2.md
	pandoc -o Materials_Week2.html Materials_Week2.md
	open Materials_Week2.html

GRanges_Intermediate: GRanges_Intermediate.Rmd
	$(RENDER) render("GRanges_Intermediate.Rmd" $(RENDER_END)
	$(RENDER2) purl("GRanges_Intermediate.Rmd" $(RENDER2_END)

Biostrings_Intermediate: Biostrings_Intermediate.Rmd
	$(RENDER) render("Biostrings_Intermediate.Rmd" $(RENDER_END)
	$(RENDER2) purl("Biostrings_Intermediate.Rmd" $(RENDER2_END)

Biostrings_Basic: Biostrings_Basic.Rmd
	$(RENDER) render("Biostrings_Basic.Rmd" $(RENDER_END)
	$(RENDER2) purl("Biostrings_Basic.Rmd" $(RENDER2_END)

fixme:
	grep FIXME *.Rmd

all: Materials_Week2 

clean:
	rm -f *~ *.pdf

